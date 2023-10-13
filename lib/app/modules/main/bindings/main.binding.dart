import 'package:get/get.dart';

import '../controllers/main.controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
          () => MainController(),
    );
  }
}