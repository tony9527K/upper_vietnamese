import '../compatible/io.dart';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'package:get/get.dart';


import '../base/local_storage.dart';

class _DB extends DataBase {
  @override
  Map<Type, TypeStringAndInstance> get registerTypes => {
    Locale: TypeStringAndInstance<Locale>(
      instance: (text) => Locale.fromSubtags(
        languageCode: (text as String).split("_").first,
        countryCode: text.split("_").last,
      ),
      string: (value) => (value as Locale).languageCode == "zh"
          ? "${value.languageCode}_${value.scriptCode ?? "Hans"}"
          : value.toString(),
    ),
  };

  /// 注册模型
  @override
  Map<Type, Function> get registerModel => {
    // ApiUserLoginReturns: ApiUserLoginReturns.fromJson,
  };


  /// 获取ip地址 ipAdress
  String get ipAdress => this["ipAdress"] ?? '';

  /// 更新ip地址 ipAdress
  Future<bool> updateIpAdress(String? value) {
    return setValue("ipAdress", value);
  }

  /// 获取token
  String get token => this["token"] ?? '';

  /// 更新token
  Future<bool> tokenSet(String? value) async{
    return setValue("token", value);
  }

  /// 获取search
  String? get search => this["search"];








  /// 获取主题 theme
  String get theme => this["theme"] ?? "dark";

  /// 更新主题
  Future<bool> updateTheme(String? value) {
    return setValue("theme", value);
  }

  /// 获取渠道号 inviteCode
  String get inviteCode => this["inviteCode"] ?? "";

  /// 更新取到号
  Future<bool> updateInviteCode(String? value) {
    return setValue("inviteCode", value);
  }

  /// 获取国际化 locale
  Locale get locale {
    return this["locale"] ??
            () {
          var locale = Get.deviceLocale ?? const Locale("en", "US");
          var languageCode = locale.languageCode;
          if (languageCode == "zh") {
            return Locale.fromSubtags(
              languageCode: languageCode,
              countryCode: locale.scriptCode ?? "Hans",
            );
          } else {
            return locale;
          }
        }();
  }

  /// 更新国际化
  Future<bool> updateLocale(Locale? value) async {
    return setValue("locale", value);
  }

  /// 获取接口地址 apiBaseUrl
  String? get apiBaseUrl => this["apiBaseUrl"];

  /// 更新接口地址
  Future<bool> updateApiBaseUrl(String? value) async {
    return setValue("apiBaseUrl", value?.trim());
  }


}

// ignore: non_constant_identifier_names
final DB = _DB();
