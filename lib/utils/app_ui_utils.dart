import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class UIUtil {

  static UIUtil instance = UIUtil();

  /// Show Toast
  Future showToast(BuildContext? context, String msg) async{
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: Text(msg),
      ),
    );
  }

  dismissToast(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } catch (e) {
      print(e);
    }
  }

  void errorToast(BuildContext context, String msg, String buttonText, Function()? call) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: buttonText,
          textColor: Colors.white,
          onPressed:() => (call==null) ? dismissToast(context) : call,
        ),
      ),
    );
  }

  /// Loader Behavior
  void showLoading() {
    EasyLoading.show(status: 'loading'.tr,
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black);
  }

  void stopLoading() {
    EasyLoading.dismiss(animation: true);
  }

  void onNoInternet() {
    EasyLoading.show(status: "noInternet".tr,
        indicator: Icon(Icons.signal_cellular_connected_no_internet_4_bar,
          color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black).then((value) {
      Timer(Duration(seconds: 3), () => EasyLoading.dismiss());
    });

  }

  void onFailed(String failedMsg) {
    EasyLoading.show(status: failedMsg,
        indicator: Icon(Icons.sms_failed_outlined, color: Colors.white70,),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black).then((value) {
      Timer(Duration(seconds: 3), () => EasyLoading.dismiss());
    });
  }

  ///Custom Dialog
  showCustomDialog(BuildContext context,{required Widget? child, double? borderRadius = 10.0}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(borderRadius!)), //this right here
            child: Wrap(
              children: [
                child!,
              ],
            ),
          );
        }
    );
  }

  ///Alert Dialog
  showAlertDialog(BuildContext context,{String? title, String? subTitle , required Function()? actionFunction}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: (title != null) ? Center(child: FittedBox(child: Text(title))) : null,
            content: (subTitle != null) ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    subTitle,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ) : null,
            actions: <Widget>[
              ElevatedButton(
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              ElevatedButton(
                child: Text('Ok'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey),
                onPressed: actionFunction,
              ),
            ],
          );
        }
    );
  }

  ///bottom sheet
  showBottomSheet(BuildContext context,{required Widget? child}){
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (builder) {
          return Wrap(
            children: [
              child!,
            ],
          );
        }
    );
  }

}