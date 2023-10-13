import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class _Json {}

class _Data {
  _Data._();
  static const _sm = "@:_sm_:@";
  static Map<Type, Function(String)> typeExample = {
  int: (s) => int.parse(s),
  double: (s) => double.parse(s),
  bool: (s) => s == "true",
  String: (s) => s,
  RegExp: (s) {
  int i = s.lastIndexOf("/");
  String v = s.substring(7, i);
  Map<String, bool> pm = {"m": false, "i": true, "u": false, "s": false};
  s.substring(i + 1).split('').forEach((e) => (pm[e] = !pm[e]!));
  return RegExp(v,
  multiLine: pm["m"]!,
  caseSensitive: pm["i"]!,
  unicode: pm["u"]!,
  dotAll: pm["s"]!);
  },
  _Json: (s) => jsonDecode(s),
  Map<dynamic, dynamic>: (s) => (jsonDecode(s) as Map).map(
  (key, value) => MapEntry(stringToValue(key), stringToValue(value))),
  Set<dynamic>: (s) => s.split(_sm).map((e) => stringToValue(e)).toSet(),
  List<dynamic>: (s) => s.split(_sm).map((e) => stringToValue(e)).toList(),
  };

  static final Map<String, dynamic Function(dynamic)> _valueToStringFn = {
    "int": (e) => "int-${e.toString()}",
    "String": (e) => "String-${e.toString()}",
    "double": (e) => "double-${e.toString()}",
    "bool": (e) => "bool-${e.toString()}",
    "JSSyntaxRegExp": (e) => "RegExp-${e.toString()}",
    "IdentityMap<String, String>": (e) => "_Json-${jsonEncode(e)}",
    "IdentityMap<String, int>": (e) => "_Json-${jsonEncode(e)}",
    "IdentityMap<String, double>": (e) => "_Json-${jsonEncode(e)}",
    "IdentityMap<String, bool>": (e) => "_Json-${jsonEncode(e)}",
    "${List<String>}": (e) => "_Json-${jsonEncode(e)}",
    "${List<int>}": (e) => "_Json-${jsonEncode(e)}",
    "${List<double>}": (e) => "_Json-${jsonEncode(e)}",
    "${List<bool>}": (e) => "_Json-${jsonEncode(e)}",
    "$Set": (e) => "$Set-${_getLikeArrayValueString(e)}",
    "$List": (e) => "$List-${_getLikeArrayValueString(e)}",
    "$Map": (e) => "$Map-${_getLikeJsonValueString(e)}",
  };

  static Map<String, Type> get types {
    Map<String, Type> map = {};
    typeExample.forEach((type, fn) {
      map.addAll({"$type": type});
    });
    return map;
  }

  static dynamic stringToValue(String? str) {
    if (str != null && str != '') {
      int i = str.indexOf("-");
      return typeExample[types[str.substring(0, i)]]
          ?.call(str.substring(i + 1));
    } else {
      return null;
    }
  }

  static String _getLikeArrayValueString(dynamic v) {
    List<String> str = [];
    v.forEach((element) {
      str.add(valueToString(element));
    });
    return str.join(_sm);
  }

  static String _getLikeJsonValueString(dynamic v) {
    Map<String, String> str = {};
    v.forEach((key, value) {
      str.addAll({valueToString(key): valueToString(value)});
    });
    return jsonEncode(str);
  }

  static String valueToString(dynamic value) {
    Function(dynamic)? fn = _valueToStringFn[value.runtimeType.toString()];
    if (fn == null) {
      if (value is Set) return _valueToStringFn["$Set"]!(value);
      if (value is List) return _valueToStringFn["$List"]!(value);
      if (value is Map) return _valueToStringFn["$Map"]!(value);
      return '';
    } else {
      return fn(value);
    }
  }
}

class TypeStringAndInstance<T> {
  final String Function(dynamic) string;
  final T Function(dynamic) instance;
  static const String joinString = "@:_sm_:@";
  TypeStringAndInstance({
    required this.string,
    required this.instance,
  });
}

abstract class DataBase {
  final Map<String, dynamic> _datas = {};

  static String? androidLocalAccount;
  static String? androidLocalPassword;

  DataBase() {
    try {
      registerTypes.forEach((t, obj) {
        _registerType(t, obj.instance, obj.string);
      });
      registerModel.forEach((t, f) {
        _registerType(
            t, (e) => f(jsonDecode(e)), (e) => jsonEncode(e.toJson()));
      });
    } on UnimplementedError {
      ///
    }
  }


  ///存储对象
  static SharedPreferences? _sharedPreferences;

  ///初始化
  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  void _registerType(
      Type t, [
        Function(String)? fromJson,
        String Function(dynamic)? toString,
      ]) {
    if (_Data.typeExample[t] == null) {
      _Data.typeExample.addAll({t: (e) => fromJson?.call(e) ?? e});
      _Data._valueToStringFn.addAll(
        {"$t": (e) => "$t-${toString?.call(e) ?? e.toString()}"},
      );
    }
  }

  final Map<String, List<Function>> _listener = {};

  /// fn = ListenerFn
  void addListener(String key, Function fn) {
    _listener[key] ??= [];
    _listener[key]!.add(fn);
  }

  void removeListener(Function fn) {
    _listener.forEach((key, value) {
      value.remove(fn);
    });
  }

  /// 清除所有
  Future<bool> clear() async {
    var a = await _sharedPreferences!.clear();
    _datas.clear();
    return a;
  }

  /// 更新值 空值为删除
  Future<bool> setValue<T>(String key, [dynamic value]) {
    if (value != null) {
      _datas[key] = value;
      // _types[key] = T;
      Future<bool> ret =
      _sharedPreferences!.setString(key, _Data.valueToString(value));
      ret.then((bol) {
        _listener[key]?.forEach((fn) {
          fn(value);
        });
      });
      return ret;
    } else {
      _datas.remove(key);
      Future<bool> ret = _sharedPreferences!.remove(key);
      ret.then((bol) {
        _listener[key]?.forEach((fn) {
          fn(null);
        });
      });
      return ret;
    }
  }

  Map<Type, TypeStringAndInstance> get registerTypes;
  Map<Type, Function> get registerModel;
  operator [](key) {
    return _datas[key] ??
        _Data.stringToValue(_sharedPreferences?.getString(key));
  }
}
