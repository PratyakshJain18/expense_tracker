import 'package:get/get.dart';

import 'Controller/homepage_controller.dart';
class Binding extends Bindings{

  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController());
  }

}