import 'package:get/get.dart';
import 'package:softtic_assessment/screens/controller/loginController.dart';

class LoginScreenBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}