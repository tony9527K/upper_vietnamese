import 'package:get/get.dart';
import 'package:upper_vn/app/modules/main/views/main.view.dart';
import 'package:upper_vn/app/modules/main/bindings/main.binding.dart';
class AppPages {
  AppPages._();

  static const INITIAL = '/main';
  static final routes = [
    GetPage(
      name: '/main',
      page: () => const MainView(),
      binding: MainBinding(),
    ),
  ];
}