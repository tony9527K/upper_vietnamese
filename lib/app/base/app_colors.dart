import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// 建议删除 应该调用主题属性
class AppColors {
  AppColors._();

  static const cff7131fd = Color(0xffe6abff);
  static const cffff3eea = Color(0xffff3eea);
  static const cfff4ff65 = Color(0xfff4ff65);
  static const cffc0ff96 = Color(0xffc0ff96);
  static const cffe1e1e1 = Color(0xffe1e1e1);
  static const cff7c7e86 = Color(0xff7c7e86);
  static const c66ffffff = Color(0x66ffffff);
  static const cff010001 = Color(0xff010001);
  static const cd6000000 = Color(0xd6000000);
  static const cff0a0d13 = Color(0xff0a0d13);
  static const cff2f313c = Color(0xff2f313c);
  static const cff231f35 = Color(0xff231f35);
  static const c009f9f9f = Color(0x009f9f9f);
  static const c99ffffff = Color(0x99ffffff);
  static const cff07072d = Color(0xff07072d);
  static const cff77818d = Color(0xff77818d);

  /// 主题主色
  /// - dark: 0xff7131fd
  /// - light: 0xff7131fd
  static Color get themeColor => Get.isDarkMode ? cff7131fd : cff7131fd;

  /// 主题辅色1
  /// - dark: 0xffff3eea
  /// - light: 0xffff3eea
  static Color get themeAssistColor1 => Get.isDarkMode ? cffff3eea : cffff3eea;

  /// 主题辅色2
  /// - dark: 0xfff4ff65
  /// - light: 0xfff4ff65
  static Color get themeAssistColor2 => Get.isDarkMode ? cfff4ff65 : cfff4ff65;

  /// 主题辅色3
  /// - dark: 0xffc0ff96
  /// - light: 0xffc0ff96
  static Color get themeAssistColor3 => Get.isDarkMode ? cffc0ff96 : cffc0ff96;

  /// 主题辅色4
  /// - dark: 0xff231f35
  /// - light: 0xff231f35
  static Color get themeAssistColor4 => Get.isDarkMode ? cff231f35 : cff231f35;

  /// 文本主色
  /// - dark: 0xffe1e1e1
  /// - light: 0xffe1e1e1
  static Color get textColor => Get.isDarkMode ? cffe1e1e1 : cffe1e1e1;

  /// 文本辅色1
  /// - dark: 0xff7c7e86
  /// - light: 0xff7c7e86
  static Color get textAssistColor1 => Get.isDarkMode ? cff7c7e86 : cff7c7e86;

  /// 页面背景色
  /// - dark: 0xff0a0d13
  /// - light: 0xff0a0d13
  static Color get backgroundColor => Get.isDarkMode ? cff0a0d13 : cff0a0d13;

  /// 底部导航背景色
  /// - dark: 0xff010001
  /// - light: 0xff010001
  static Color get bottomAppBarColor => Get.isDarkMode ? cff010001 : cff010001;

  /// 输入框背景色
  /// - dark: 0xff2f313c
  /// - light: 0xff2f313c
  static Color get textFieldBackgroundColor =>
      Get.isDarkMode ? cff2f313c : cff2f313c;

  /// 指示器背景色
  /// - dark: Colors.white.withOpacity(0.2)
  /// - light: Colors.white.withOpacity(0.2)
  static Color get indicatorBackgroundColor => Get.isDarkMode
      ? Colors.white.withOpacity(0.2)
      : Colors.white.withOpacity(0.2);

  /// 指示器前景色
  /// - dark: Colors.white
  /// - light: Colors.white
  static Color get indicatorForegroundColor =>
      Get.isDarkMode ? Colors.white : Colors.white;

  static Color vipTextColorGet(int vipId) {
    return {
      0: Color(0xff1f252c),
      1: Color(0xff0883ff),
      2: Color(0xff2b7693),
      3: Color(0xff914119),
      4: Color(0xff4235e1),
      5: Color(0xffe4419d),
      9: Color(0xff3aa1b1),
    }[vipId] ??
        Color(0xff1f252c);
  }
}
