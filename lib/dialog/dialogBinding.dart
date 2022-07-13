import 'package:ahmad/dialog/dialogController.dart';
import 'package:get/get.dart';

class DialogBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DialogController());
  }

}