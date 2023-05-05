import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:softtic_assessment/dataModel/ProductListBaseResponse.dart';
import 'package:softtic_assessment/network/api_urls.dart';
import 'package:softtic_assessment/utils/shared_pref_utils.dart';

class HomeDataController extends GetxController {

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

}
