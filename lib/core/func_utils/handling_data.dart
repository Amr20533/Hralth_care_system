import 'package:co_rhema/core/class/status_request.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
    /// not good
    // if(response == StatusRequest.OFFLINEFAILURE){
    //   return StatusRequest.OFFLINEFAILURE;
    // }else{
    //   return StatusRequest.SERVERFAILURE;
    // }

  }else{
    return StatusRequest.success;
  }
}