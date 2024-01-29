
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformCheck{
  static String platform = 'Unknown';
  static bool phsDevice = false;
  static void checkPlatform(){


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
    phsDevice = (platform == 'Android' || platform == 'ios');
  }

}