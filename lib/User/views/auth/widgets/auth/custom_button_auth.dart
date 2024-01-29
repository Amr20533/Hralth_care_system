import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
   CustomButtonAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);
  String platform = 'Unknown';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Check if the app is running on the web
    if (kIsWeb) {
      platform = 'Web';
    } else {
      // Check if running on desktop (Windows, Linux, macOS)
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        platform = 'Desktop';
      }
      // Check if running on Android
      else if (Platform.isAndroid) {
        platform = 'Android';
      }else{
        platform = 'ios';
      }
    }
    bool phsDevice = (platform == 'Android' || platform == 'ios');
    return Container(
      width: phsDevice ? 330.0.w : size.width * 0.35,height: phsDevice ? 60.h : size.height * 0.07,
      margin:const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape:phsDevice ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.w)) : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)) ,
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: myBlueColor,
        textColor: Colors.white,
        child: Text(text , style:TextStyle(fontWeight: FontWeight.bold , fontSize: 16.w)),
      ),
    );
  }
}