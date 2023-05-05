import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softtic_assessment/utils/app_common_util.dart';

import '../utils/AppColorUtils.dart';
import '../utils/AppImageUitls.dart';
import '../utils/spacers.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  dynamic argumentData = Get.arguments;
  var name,description,price,stock,image,brand;

  @override
  void initState() {
    name = argumentData[0];
    description = argumentData[1];
    stock = argumentData[2];
    price = argumentData[3];
    brand = argumentData[4];
    image = argumentData[5];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: CommonUtil.instance.getScreenHeight(context),
          width: CommonUtil.instance.getScreenWidth(context),
          child: Column(
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
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,)
                      ),
                      HSpacer20(),
                      const Text(
                        "Product Details",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      File(image["image"]).existsSync() == true
                          ? Image.file(File(image["image"]))
                          : Image.asset(AppImageUtils.instance.placeholderImage,),
                      VSpacer20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stock: ${stock["stock"]}",
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            "\$ ${price["price"]}",
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      VSpacer20(),
                      Text(
                        "${name["name"]}",
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      VSpacer10(),
                      Text(
                        "Brand: ${brand["brand"]}",
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      VSpacer10(),
                      Text(
                        "Description: ${description["description"]}",
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
