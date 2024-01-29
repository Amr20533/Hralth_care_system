import 'package:co_rhema/core/services/app_services.dart';
import 'package:get/get.dart';

initHelper()async{
  await Get.putAsync(() => AppServices().init());
}