import 'dart:convert';

import 'package:co_rhema/User/views/doc/views/chat/doc_chat_screen.dart';
import 'package:co_rhema/User/views/doc/views/doc_layout.dart';
import 'package:co_rhema/User/views/doc/views/doc_man_home_screen.dart';
import 'package:co_rhema/core/class/crud.dart';
import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/core/func_utils/handling_data.dart';
import 'package:co_rhema/core/services/app_services.dart';
import 'package:co_rhema/link_api.dart';
import 'package:co_rhema/shares/remote/remote_test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DocManagementHomeController extends GetxController {
  late TextEditingController searchController;
  final curTab = 0.obs;

  List data = [];
  late StatusRequest statusRequest;
  Crud crud = Crud();
  static var client = http.Client();
  AppServices services = Get.find();
  String selectedValue = '148'.tr;
  List<String> dayList = ['163'.tr,'148'.tr,'164'.tr].obs;
  bool clicked = false;

  final List screen = [
    DocLayout(),
    Center(child: Text('Calender Screen'),),
    DocChatScreen(),
    Center(child: Text('Chart Screen'),),
    Center(child: Text('Settings Screen'),),
    ].obs;

  void changeCurTab(int index){
    curTab.value = index;
  }

  void changeDayList(String? newValue){
    selectedValue = newValue!;
    update();
  }

  String? getDocId(){
    String? docId = services.sharedPreferences.getString("docId");
    // debugPrint(docId);
    return docId;
  }


  void logoutClicked(){
    clicked = !clicked;
    update();
  }

  // @override
  doctorLogout()async {

    statusRequest = StatusRequest.LOADING;
    bool res = true;
    services.sharedPreferences.remove('doc-token');
    services.sharedPreferences.remove('docId');
    services.sharedPreferences.setBool('isLoggedIn',false);
    services.sharedPreferences.getBool('isLoggedIn') ?? false;
    statusRequest = StatusRequest.success;
    res = true;
    return res;
    // update();
  }

  // getAllData() async {
  //   statusRequest = StatusRequest.LOADING;
  //   final token = services.sharedPreferences.getString("doc-token");
  //   debugPrint(">>>>>>>>>>>>> TOKEN <<<<<<<<<< $token");
  //
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //
  //   var url = Uri.http(AppLink.server, AppLink.doctorGetAllData);
  //   var response = await client.get(url, headers: requestHeaders);
  //
  //   debugPrint("==================== Response Body ${response.body}");
  //
  //   if (response.statusCode == 200) {
  //     statusRequest = StatusRequest.success;
  //     debugPrint(">>>>>>>>>>>>>Status request >>>>>>>>>>>>> $statusRequest");
  //     // Parse the response body as JSON
  //     Map<String, dynamic> responseBody = json.decode(response.body);
  //
  //     if (responseBody.containsKey('data')) {
  //       data.addAll(responseBody['data']['data']);
  //       // debugPrint('${data.length}');
  //       // return true;
  //     } else {
  //       debugPrint("Response does not contain the expected 'data' field.");
  //     }
  //     return true;
  //   } else {
  //         statusRequest = StatusRequest.FAILURE;
  //     print("==================== Error Response ${response.body}");
  //     return false;
  //   }
  //
  // }




  getData() async{
    // statusRequest = StatusRequest.LOADING;

    final token = services.sharedPreferences.getString("doc-token");
    // debugPrint(">>>>>>>>>>>>> TOKEN <<<<<<<<<< $token");

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(AppLink.server, AppLink.doctorGetAllData);
    var response = await crud.getData(url,requestHeaders);
  // update();
  return response.fold((left) => left, (right) => right);
  }
  getAllData() async {
      statusRequest = StatusRequest.LOADING;
      var response = await getData();
      print("==================== Controller $response");
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response.containsKey('data')) {
          data.addAll(response['data']['data']);
          // debugPrint('${data.length}');
          // return true;
        } else {
          debugPrint("Response does not contain the expected 'data' field.");
          statusRequest = StatusRequest.FAILURE;
          // update();

        }
        update();
      }else{
        statusRequest = StatusRequest.SERVERFAILURE;
        update();
      }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getAllData();
    getDocId();
    super.onInit();
  }
@override
  void dispose() {
    searchController.dispose();
    getAllData();
    getDocId();
    super.dispose();
  }
}
/*

if (response['status'] == 'success') {
        print("Yup^^ ${response['status']}");
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.FAILURE;
      }
      update();
    }
    if (response.statusCode == 201) {
      statusRequest = handlingData(response);

*/