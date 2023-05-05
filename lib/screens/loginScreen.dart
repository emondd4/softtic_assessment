import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:softtic_assessment/screens/controller/loginController.dart';
import 'package:softtic_assessment/utils/AppColorUtils.dart';

import '../utils/AppImageUitls.dart';
import '../utils/spacers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController userController;
  late TextEditingController passController;

  bool isObscure = false;

  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    userController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,10.0,10.0,20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VSpacer100(),
                  VSpacer60(),
                  Image.asset(AppImageUtils.instance.shopImage, height: 120,),
                  VSpacer60(),
                  const Text("Login with your credentials", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.black),),
                  VSpacer40(),
                  TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your user here",
                      hintStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                  VSpacer20(),
                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                          child: Icon(isObscure == true ? Icons.visibility : Icons.visibility_off,color: Colors.grey,)
                      ),
                      hintText: "Type your password here",
                      hintStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black26),
                    ),
                    obscureText: !isObscure,
                    keyboardType: TextInputType.text,
                  ),
                  Container(height: 1,width: MediaQuery.of(context).size.width,color: Colors.black26,),
                  VSpacer60(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,5.0,0.0,5.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          loginController.validateRequest(userController.text,passController.text);
                        });
                      },
                      child: Container(
                        height: 43.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColorUtils.instance.yellow
                        ),
                        child: const Center(child: Text("Login", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
