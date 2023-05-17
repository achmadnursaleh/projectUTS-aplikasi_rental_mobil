import 'package:carrental/controllers/brand.controller.dart';
import 'package:carrental/controllers/mobil.controller.dart';
import 'package:carrental/controllers/sewa.controller.dart';
import 'package:carrental/controllers/util.controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrandController());
    Get.put(UtilController());
    Get.lazyPut(() => CarController());
    Get.lazyPut(() => RentController());
  }
}
