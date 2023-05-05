import 'package:get/get.dart';
import 'package:softtic_assessment/dataModel/LoginBaseModel.dart';
import 'package:softtic_assessment/network/api_repository.dart';
import 'package:softtic_assessment/screens/homeScreen.dart';

import '../../utils/app_common_util.dart';
import '../../utils/app_ui_utils.dart';
import '../../utils/shared_pref_utils.dart';

class LoginController extends GetxController{

  LoginBaseModel? loginBaseModel;
  final ApiRepository _apiRepository = ApiRepository();

  @override
  void onInit() {

  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }

  void validateRequest(String user, String pass){
    if(user.isEmpty){
      UIUtil.instance.showToast(Get.context, "User Can't Be Empty");
      return;
    }

    if(pass.isEmpty){
      UIUtil.instance.showToast(Get.context, "Password Can't Be Empty");
      return;
    }

    requestLogin(user,pass);
  }

  /// Api Calls
  Future requestLogin(String user,String pass) async {

    var body = {
      "username":user,
      "password":pass,
      "rememberMe":true
    };

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.postLogin(Get.context, null, body,
            onSuccess: (LoginBaseModel? response) async {
              UIUtil.instance.stopLoading();
              if (response != null) {
                if (response.idToken?.isNotEmpty == true) {
                  loginBaseModel = response;
                  saveToken(response.idToken);
                } else {
                  UIUtil.instance.onFailed("Failed to Login");
                }
              } else {
                UIUtil.instance.onFailed('Login Failed');
              }
            }, onFailure: (String error) {

            });
      } else {
        UIUtil.instance.stopLoading();
        UIUtil.instance.onNoInternet();
      }
    });
  }

  void saveToken(String? idToken) async {
    await SharedPrefUtil.writeString("isLoggedIn", idToken.toString());
    Get.to(() => const HomePage());
  }

}