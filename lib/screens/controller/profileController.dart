import 'package:get/get.dart';
import '../../dataModel/ProfileBaseResponse.dart';
import '../../network/api_repository.dart';
import '../../utils/app_common_util.dart';
import '../../utils/app_ui_utils.dart';

class ProfileController extends GetxController{

  ProfileBaseResponse profileBaseResponse = ProfileBaseResponse();
  final ApiRepository _apiRepository = ApiRepository();
  var isDataLoading = false.obs;

  @override
  void onInit() {
    getProfileData();
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }

  /// Api Calls
  Future getProfileData() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.getProfileInfo(Get.context, null, null,
            onSuccess: (ProfileBaseResponse? response) async {
              UIUtil.instance.stopLoading();
              if (response != null) {
                isDataLoading(true);
                profileBaseResponse = response;
              } else {
                UIUtil.instance.onFailed('Login Failed');
                isDataLoading(false);
              }
            }, onFailure: (String error) {
              isDataLoading(false);
            });
      } else {
        UIUtil.instance.stopLoading();
        UIUtil.instance.onNoInternet();
        isDataLoading(false);
      }
    });
  }

}