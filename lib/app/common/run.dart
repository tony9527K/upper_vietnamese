import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../compatible/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../routes/app_pages.dart';
import '../base/app_route_observer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'global.dart';
Future<void> run() async {

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UpperVietnamese",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [AppRouteObserver.routeObserver],
      darkTheme: Global.theme,
      themeMode: ThemeMode.dark,
      // translationsKeys: AppTranslation.translations
      builder: EasyLoading.init(builder: (context, child) {
        Global.width = MediaQuery.of(context).size.width;
        /// 设置文字大小不随系统设置改变
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }),
    ),
  );

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}