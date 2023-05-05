import 'package:get/get.dart';
import 'package:softtic_assessment/dataModel/ProductListBaseResponse.dart';

import '../../network/api_repository.dart';
import '../../utils/app_common_util.dart';
import '../../utils/app_ui_utils.dart';

class HomeDataController extends GetxController {

  ProductListBaseResponse? productListBaseResponse;

  final ApiRepository _apiRepository = ApiRepository();


  @override
  Future<void> onInit() async {
    getProductsList();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  /// Api Calls
  Future getProductsList() async {

    var params = {
      "page":0,
      "size":20,
    };

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.getProductList(Get.context, params, null,
            onSuccess: (List<ProductListBaseResponse> response) async {
              UIUtil.instance.stopLoading();
              if (response != null) {
                if (response.isNotEmpty == true) {

                } else {
                  UIUtil.instance.onFailed("Failed to Fetch Products");
                }
              } else {
                UIUtil.instance.onFailed('Fetch Product Failed');
              }
            }, onFailure: (String error) {
              UIUtil.instance.stopLoading();
              UIUtil.instance.onFailed('Something Went Wrong');
            });
      } else {
        UIUtil.instance.stopLoading();
        UIUtil.instance.onNoInternet();
      }
    });
  }

}
