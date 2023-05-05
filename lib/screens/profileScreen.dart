import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softtic_assessment/screens/controller/profileController.dart';
import 'package:softtic_assessment/utils/app_common_util.dart';
import 'package:softtic_assessment/utils/spacers.dart';

import '../utils/AppColorUtils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: CommonUtil.instance.getScreenHeight(context),
        width: CommonUtil.instance.getScreenWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(top: 0,left: 0,right: 0,child: Container(
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
                                child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,)
                            ),
                            HSpacer20(),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),),
                    Positioned(top: 55,left: MediaQuery.of(context).size.width/3,right: MediaQuery.of(context).size.width/3,child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Obx(() => profileController.isDataLoading.value == false
                              ? CircleAvatar(radius:60.0, backgroundColor: AppColorUtils.instance.fadeYellow,child: Text("P",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color:AppColorUtils.instance.yellow,fontSize:50,fontFamily: "Nunito Sans")))
                                : CircleAvatar(radius: 60,backgroundImage: NetworkImage(profileController.profileBaseResponse.imageUrl.toString())
                          ),
                        ))),
                        Positioned(
                          right: 1.0,
                          bottom: 20.0,
                          child: InkWell(
                            onTap: () {
                              setState(() {

                              });
                            },
                            child: CircleAvatar(
                              radius: 13.0,
                              backgroundColor: AppColorUtils.instance.yellow,
                              child: Icon(Icons.edit,size: 20.0,color:Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
              ),
              VSpacer40(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,10.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Obx(() => profileController.isDataLoading.value == false
                            ? const Expanded(child: Text("Loading...",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))
                            : Expanded(child: Text("${profileController.profileBaseResponse.firstName} ${profileController.profileBaseResponse.lastName}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))),
                        Icon(Icons.supervised_user_circle_outlined, color: AppColorUtils.instance.yellow,)
                      ],
                    ),
                  ),
                ),
              ),
              VSpacer5(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,10.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Obx(() => profileController.isDataLoading.value == false
                            ? const Expanded(child: Text("Loading...",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))
                            : Expanded(child: Text("${profileController.profileBaseResponse.email}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))),
                          Icon(Icons.mail_outline_outlined, color: AppColorUtils.instance.yellow,)
                      ],
                    ),
                  ),
                ),
              ),
              VSpacer5(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,10.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      children: [
                        Obx(() => profileController.isDataLoading.value == false
                            ? const Expanded(child: Text("Loading...",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))
                            : Expanded(child: Text("${profileController.profileBaseResponse.phone}",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15),))),
                          Icon(Icons.phone, color: AppColorUtils.instance.yellow,)
                      ],
                    ),
                  ),
                ),
              ),
              VSpacer40(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                child: InkWell(
                  onTap: () {
                    profileController.logout();
                  },
                  child: Container(
                    height: 43.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColorUtils.instance.yellow
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout,color: Colors.black,),
                        HSpacer10(),
                        Text("Logout", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
