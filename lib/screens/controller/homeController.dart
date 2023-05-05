import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:softtic_assessment/dataModel/DeleteBaseResponse.dart';
import 'package:softtic_assessment/dataModel/ProductListBaseResponse.dart';
import 'package:softtic_assessment/network/api_urls.dart';
import 'package:softtic_assessment/utils/shared_pref_utils.dart';

import '../../network/api_repository.dart';
import '../../utils/app_common_util.dart';
import '../../utils/app_ui_utils.dart';

class HomeDataController extends GetxController {

  final ApiRepository _apiRepository = ApiRepository();
  late List<ProductListBaseResponse> productList;
  var isDataLoading = false.obs;

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

    try {
      isDataLoading(true);
      final dio = Dio();
      dio.options.headers["authorization"]="Bearer ${await SharedPrefUtil.getString("isLoggedIn")}";
      Response response = await dio.get(ApiUrls.baseUrl+ApiUrls.productList,queryParameters: params);
        productList = (response.data as List)
          .map((x) => ProductListBaseResponse.fromJson(x))
          .toList();
       // print("ProductList ${productList.length}");
    } catch (error, stacktrace) {
      throw Exception("Exception : $error stackTrace: $stacktrace");
    }finally{
      isDataLoading(false);
    }

  }

  Future deleteProduct(int id) async {
    var params = {
      "id":id,
    };

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.deleteProduct(Get.context, params, null,
            onSuccess: (DeleteBaseResponse? response) async {
              UIUtil.instance.stopLoading();
              if (response != null) {
                getProductsList();
                Get.back();
                UIUtil.instance.showToast(Get.context, "Product Deleted");
              } else {
                UIUtil.instance.stopLoading();
                UIUtil.instance.onFailed('Delete Failed');
              }
            }, onFailure: (String error) {
              getProductsList();
              Get.back();
              UIUtil.instance.showToast(Get.context, "Product Deleted");
              UIUtil.instance.stopLoading();
            });
      } else {
        UIUtil.instance.stopLoading();
        UIUtil.instance.onNoInternet();
      }
    });
  }

}
