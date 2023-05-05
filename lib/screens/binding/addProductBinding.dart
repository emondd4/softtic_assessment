import 'package:get/get.dart';

import '../controller/addProductController.dart';

class AddProductBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(() => AddProductController());

  }

}