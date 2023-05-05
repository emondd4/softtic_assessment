import 'package:flutter/material.dart';
import 'package:softtic_assessment/utils/app_common_util.dart';

import '../utils/AppColorUtils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: CommonUtil.instance.getScreenHeight(context),
        width: CommonUtil.instance.getScreenWidth(context),
        child: SingleChildScrollView(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {

                        },
                          child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black,)
                      ),
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
