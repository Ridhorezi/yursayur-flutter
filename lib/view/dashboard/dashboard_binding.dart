import 'package:get/get.dart';
import 'package:yursayur/controller/dashboard_controller.dart';
import 'package:yursayur/controller/home_controller.dart';
import 'package:yursayur/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
  }
}
