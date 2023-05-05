import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softtic_assessment/dataModel/AddProductBaseResponse.dart';

import '../../network/api_repository.dart';
import '../../utils/app_common_util.dart';
import '../../utils/app_ui_utils.dart';
import 'homeController.dart';

class AddProductController extends GetxController{

  final ApiRepository _apiRepository = ApiRepository();
  File? imagePath;
  HomeDataController homeDataController = Get.put(HomeDataController());

  var isImagePicked = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future imageDialog() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      imagePath = imageTemp;
      isImagePicked(true);
      //print(imagePath);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void validateRequest(String name, String details,int quantity,String unit, int price){
    if(name.isEmpty){
      UIUtil.instance.showToast(Get.context, "Name Can't Be Empty");
      return;
    }

    if(details.isEmpty){
      UIUtil.instance.showToast(Get.context, "Details Can't Be Empty");
      return;
    }

    if(unit.isEmpty){
      UIUtil.instance.showToast(Get.context, "Unit Can't Be Empty");
      return;
    }

    if(imagePath?.path.isEmpty == true){
      UIUtil.instance.showToast(Get.context, "Please Select Image");
      return;
    }

    addProduct(name, details,quantity,unit,price,imagePath!.path);
  }

  ///Api Calls
  /// Api Calls
  Future addProduct(String name,String details, int quantity,String unit,int price, String imagePath) async {

    var body = {
      "name": name,
      "barcode": "barcode69",
      "description": details,
      "image": imagePath,
      "subCategory": 1851,
      "brand": 1901,
      "quantity": {
        "quantity": quantity,
        "unit": unit,
        "unitValue": 0,
        "pastQuantity": 0
      },
      "productPrice": {
        "price": price,
        "unitPrice": 0,
        "mrp": 0
      }
    };

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.addProduct(Get.context, null, body,
            onSuccess: (AddProductBaseResponse? response) async {
              UIUtil.instance.stopLoading();
              if (response != null) {
                if (response.name?.isNotEmpty == true) {
                  UIUtil.instance.showToast(Get.context, "Product Added Successfully");
                  homeDataController.getProductsList();
                  Get.back();
                } else {
                  UIUtil.instance.onFailed("Failed to Add Product");
                }
              } else {
                UIUtil.instance.onFailed('Adding Failed');
              }
            }, onFailure: (String error) {

            });
      } else {
        UIUtil.instance.stopLoading();
        UIUtil.instance.onNoInternet();
      }
    });
  }
}