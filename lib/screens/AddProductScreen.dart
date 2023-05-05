import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softtic_assessment/screens/controller/addProductController.dart';
import 'package:softtic_assessment/utils/AppImageUitls.dart';
import 'package:softtic_assessment/utils/app_common_util.dart';

import '../utils/AppColorUtils.dart';
import '../utils/app_ui_utils.dart';
import '../utils/spacers.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController quantityController;
  late TextEditingController unitController;
  late TextEditingController priceController;

  AddProductController addProductController = Get.put(AddProductController());

  @override
  void initState() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    quantityController = TextEditingController();
    unitController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: CommonUtil.instance.getScreenHeight(context),
          width: CommonUtil.instance.getScreenHeight(context),
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
                        "Add Product",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         VSpacer20(),
                         const Text(
                           "Product Name",
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               color: Colors.black),
                         ),
                         VSpacer5(),
                         TextField(
                           controller: nameController,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Product Name",
                             hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                           ),
                           keyboardType: TextInputType.text,
                         ),
                         Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                         VSpacer20(),

                         const Text(
                           "Product Details",
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               color: Colors.black),
                         ),
                         VSpacer5(),
                         TextField(
                           controller: descriptionController,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Product Description",
                             hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                           ),
                           maxLines: 5,
                           keyboardType: TextInputType.text,
                         ),
                         Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                         VSpacer20(),

                         const Text(
                           "Product Quantity",
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               color: Colors.black),
                         ),
                         VSpacer5(),
                         TextField(
                           controller: quantityController,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Product Quantity",
                             hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                           ),
                           keyboardType: TextInputType.number,
                         ),
                         Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                         VSpacer20(),

                         const Text(
                           "Product Unit",
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               color: Colors.black),
                         ),
                         VSpacer5(),
                         TextField(
                           controller: unitController,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Product Unit",
                             hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                           ),
                           keyboardType: TextInputType.text,
                         ),
                         Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                         VSpacer20(),

                         const Text(
                           "Product Price",
                           style: TextStyle(
                               fontSize: 22.0,
                               fontWeight: FontWeight.w600,
                               color: Colors.black),
                         ),
                         VSpacer5(),
                         TextField(
                           controller: priceController,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Product Price",
                             hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                           ),
                           keyboardType: TextInputType.number,
                         ),
                         Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                         VSpacer40(),

                         InkWell(
                           onTap: () {
                              addProductController.imageDialog();
                           },
                           child: Obx(() => addProductController.isImagePicked == true
                               ? Center(child: Image.file(addProductController.imagePath!,height: 150,width: 120,),)
                               : Center(child: Image.asset(AppImageUtils.instance.placeholderImage,height: 100,width: 120,))
                           ),
                         ),

                         VSpacer20(),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0.0,5.0,0.0,5.0),
                           child: InkWell(
                             onTap: () {
                                if(quantityController.text.isEmpty){
                                  UIUtil.instance.showToast(context, "Quantity Can't Be Empty");
                                  return;
                                }

                                if(priceController.text.isEmpty){
                                  UIUtil.instance.showToast(context, "Price Can't Be Empty");
                                  return;
                                }

                                addProductController.validateRequest(nameController.text,descriptionController.text,int.parse(quantityController.text),unitController.text,int.parse(priceController.text));

                             },
                             child: Container(
                               height: 43.0,
                               width: MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10.0),
                                   color: AppColorUtils.instance.yellow
                               ),
                               child: const Center(child: Text("Save Product", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),)),
                             ),
                           ),
                         ),

                       ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
