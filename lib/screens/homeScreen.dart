import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:softtic_assessment/screens/AddProductScreen.dart';
import 'package:softtic_assessment/screens/ProductDetailsScreen.dart';
import 'package:softtic_assessment/screens/controller/homeController.dart';
import 'package:softtic_assessment/screens/profileScreen.dart';
import 'package:softtic_assessment/utils/AppColorUtils.dart';
import 'package:softtic_assessment/utils/AppImageUitls.dart';
import 'package:softtic_assessment/utils/app_ui_utils.dart';

import '../utils/app_common_util.dart';
import '../utils/spacers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeDataController homeDataController = Get.put(HomeDataController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        height: CommonUtil.instance.getScreenHeight(context),
        width: CommonUtil.instance.getScreenWidth(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: AppColorUtils.instance.yellow),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Lottie.asset(AppImageUtils.instance.homeAnim,
                          repeat: true, height: 56.0, width: 56.0),
                      const Text(
                        "Softic Assessment",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ProfilePage());
                        },
                        child: Image.asset(
                          AppImageUtils.instance.userImage,
                          height: 32.0,
                          width: 32.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => homeDataController.isDataLoading.value == false
                  ? homeDataController.productList.isNotEmpty
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.52),
                          itemBuilder: (context, position) =>
                              productItem(position),
                          itemCount: homeDataController.productList.length,
                        )
                      : SizedBox(
                          height: CommonUtil.instance.getScreenHeight(context),
                          child: Center(
                              child: Lottie.asset(
                                  AppImageUtils.instance.emptyAnim)))
                  : SizedBox(
                      height: CommonUtil.instance.getScreenHeight(context),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColorUtils.instance.yellow,
                      ))))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProductPage());
        },
        backgroundColor: AppColorUtils.instance.yellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    ));
  }

  Widget productItem(int position){
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetailsPage(), arguments: [
          {"name": homeDataController.productList[position].name.toString()},
          {"description": homeDataController.productList[position].description.toString()},
          {"stock": homeDataController.productList[position].quantity?.quantity.toString()},
          {"price": homeDataController.productList[position].productPrice?.price.toString()},
          {"brand": homeDataController.productList[position].brand.toString()},
          {"image": homeDataController.productList[position].image.toString()},
        ]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColorUtils.instance.fadeYellow,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSpacer10(),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      UIUtil.instance.showAlertDialog(context, actionFunction: (){homeDataController.deleteProduct(homeDataController.productList[position].id!);},title: "Alert Dialog",subTitle: "Are You Sure Want to Delete This Product?");
                    },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 28,
                      )),
                ),
                VSpacer10(),
                Center(child: File(homeDataController.productList[position].image.toString()).existsSync() == true
                    ? Image.file(File(homeDataController.productList[position].image.toString()),height: 128,width: 128,)
                    : Image.asset(AppImageUtils.instance.placeholderImage,height: 128,width: 128,)
                ),
                VSpacer10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stock: ${homeDataController.productList[position].quantity?.quantity.toString()}",
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      "\$ ${homeDataController.productList[position].productPrice?.price.toString()}",
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                VSpacer10(),
                Text(
                  homeDataController.productList[position].name.toString(),
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                VSpacer5(),
                Text(
                  "Brand: ${homeDataController.productList[position].brand?.name.toString()}",
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                VSpacer5(),
                Text(  homeDataController.productList[position].description.toString().length >= 28
                    ? homeDataController.productList[position].description.toString().substring(0, 28)
                    : homeDataController.productList[position].description.toString(),
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
