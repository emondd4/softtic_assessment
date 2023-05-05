import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:softtic_assessment/dataModel/LoginBaseModel.dart';
import 'package:softtic_assessment/dataModel/ProductListBaseResponse.dart';
import '../dataModel/DeleteBaseResponse.dart';
import '../dataModel/ProfileBaseResponse.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {

  void postLogin(BuildContext? context, Map<String,dynamic>? params, Map<String,dynamic>? body,{void Function(LoginBaseModel)? onSuccess, void Function(String)? onFailure}) async {

    try {
      final response = await ApiClient.post(ApiUrls.baseUrl + ApiUrls.loginUrl , null, body, false,false);
      var callResponse = LoginBaseModel.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        print(callResponse);
        onFailure!(callResponse.toString());
      }
    } catch (e) {
      print(e.toString());
      onFailure!(e.toString());
    }
  }

  void getProductList(BuildContext? context, Map<String,dynamic>? params, Map<String,dynamic>? body,{void Function(List<ProductListBaseResponse>)? onSuccess, void Function(String)? onFailure}) async {

    try {
      final response = await ApiClient.get(ApiUrls.baseUrl + ApiUrls.productList , params, true,false);
      var callResponse = List<ProductListBaseResponse>.from(json.decode(json.encode(response)));
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        print(callResponse);
        onFailure!(callResponse.toString());
      }
    } catch (e) {
      print(e.toString());
      onFailure!(e.toString());
    }
  }

  void getProfileInfo(BuildContext? context, Map<String,dynamic>? params, Map<String,dynamic>? body,{void Function(ProfileBaseResponse)? onSuccess, void Function(String)? onFailure}) async {

    try {
      final response = await ApiClient.get(ApiUrls.baseUrl + ApiUrls.profileDetails , params, true,false);
      var callResponse = ProfileBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        print(callResponse);
        onFailure!(callResponse.toString());
      }
    } catch (e) {
      print(e.toString());
      onFailure!(e.toString());
    }
  }

  void deleteProduct(BuildContext? context, Map<String,dynamic>? params, Map<String,dynamic>? body,{void Function(DeleteBaseResponse)? onSuccess, void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.delete("${ApiUrls.baseUrl}${ApiUrls.deleteProduct}${params!["id"]}" , null,null, true,false);
      var callResponse = DeleteBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        print(callResponse);
        onFailure!(callResponse.toString());
      }
    } catch (e) {
      print(e.toString());
      onFailure!(e.toString());
    }
  }


}
