import 'package:get/get.dart';
import 'package:softtic_assessment/screens/controller/profileController.dart';

class ProfileScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());

  }
}