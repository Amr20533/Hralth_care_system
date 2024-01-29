import 'dart:convert';

import 'package:co_rhema/core/class/status_request.dart';
import 'package:co_rhema/core/func_utils/check_internet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart'as http;

class Crud{
  Future<Either<StatusRequest, dynamic>> postData(String url,Map<String, String>? headers, dynamic body) async{
      try{
        if(await checkInternet()){
          // var response = await http.post(Uri.parse(url),body: data);
          final response = await http.post(
            Uri.parse(url),
            headers: headers,
            body: jsonEncode(body),
          );
          if(response.statusCode == 200 || response.statusCode == 201){
            dynamic responseBody = jsonDecode(response.body);
            return Right(responseBody);
          }else{
            return const Left(StatusRequest.SERVERFAILURE);
          }
        }else{
          /// it will return StatusRequest which are on the left
          return const Left(StatusRequest.OFFLINEFAILURE);
        }
      }catch(_){
        return const Left(StatusRequest.EXCEPTIONFAILURE);
      }
  }
  Future<Either<StatusRequest, dynamic>> getData(Uri url,Map<String, String>? headers) async{
    try{
      if(await checkInternet()){
        final response = await http.get(
          url,
          headers: headers,
        );
        if(response.statusCode == 200 || response.statusCode == 201){
          dynamic responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }else{
          return const Left(StatusRequest.SERVERFAILURE);
        }
      }else{
        /// it will return StatusRequest which are on the left
        return const Left(StatusRequest.OFFLINEFAILURE);
      }
    }catch(_){
      return const Left(StatusRequest.EXCEPTIONFAILURE);
    }
  }
}