import 'package:get/get.dart';
import 'package:getx_route_test/src/pages/controller/count_controller_with_getx.dart';

class BindingPageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CountControllerWithGetX());
  }
}
