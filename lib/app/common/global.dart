
import 'package:get/get.dart';
import '../compatible/io.dart';
import 'package:flutter/material.dart';
import 'db_config.dart';
import '../base/themes.dart';
abstract class Global {
  Global._();

  static String get deviceType {
    if (kIsWeb == true) {
      return 'H';
    } else if (Platform.isAndroid == true) {
      return 'A';
    } else {
      return 'I';
    }
  }

  /// 版本
  static String version = "1.4.3";

  /// app名字
  static String appName = "xgz";

  /// 包名
  static String bundleId = "com.xgz.laosepi";

  static double width = 375.0;
  static double get _designWidth => 375.0;
  /// 顶部 StatusBar 高度
  static final statusBarHeight = Get.mediaQuery.padding.top;

  /// 底部 凹槽 高度
  static final bottomBarHeight = Get.mediaQuery.padding.bottom;

  /// 顶部 AppBar 高度
  static final topNavigationBarHeight =
      Get.mediaQuery.padding.top + kToolbarHeight;

  /// 底部 NavigationBar 高度
  static final bottomNavigationBarHeight =
      Get.mediaQuery.padding.bottom + kBottomNavigationBarHeight;

  /// 主题 DB=SharePreference
  static ThemeData get theme => themes[DB.theme]!;

  static get kIsWeb => null;
}
extension IntExtension on int {
  double get rpx {
    return this * Global.width / Global._designWidth;
  }
}

extension DoubleExtension on double {
  double get rpx {
    return this * Global.width / Global._designWidth;
  }
}