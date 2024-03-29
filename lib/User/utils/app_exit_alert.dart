import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> appExitAlert(){
  Get.defaultDialog(
    title: "Caution",
    middleText: "Do You want to exit the app",
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: const Text("Confirm"),),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: const Text("Cancel"),),
    ],
  );
  return Future.value(true);
}