import 'package:get/get.dart';
validInput(String val, int min, int max, String type) {
    // Check for null or empty value
    if (val.isEmpty) {
      return "Field cannot be empty";
    }

    // Specific validation based on the type
    switch (type) {
      case "username":
        if (!GetUtils.isUsername(val)) {
          return "Invalid username format";
        }
        break;

      case "email":
        if (!GetUtils.isEmail(val)) {
          return "Invalid email format";
        }
        break;

      case "phone":
        if (!GetUtils.isPhoneNumber(val)) {
          return "Invalid phone number format";
        }
        break;
      case "password":
        if (val.length > max) {
          return "Password length cannot exceed $max characters";
        }
        if(val.isEmpty){
          return emptyInputMessage;
        }
        // Check for length constraints
        if (val.length < min) {
          return "Password length should be at least $min characters";
        }
        break;

      default:
        return "Invalid input type";
    }
//     if(type == 'password'){
//
//     if (val.length > max) {
//       return "Password length cannot exceed $max characters";
//     }
//   if(val.isEmpty){
//     return emptyInputMessage;
//   }
//   // Check for length constraints
//   if (val.length < min) {
//     return "Password length should be at least $min characters";
//   }
//
// }


    // No validation issues
    // return null;
  }


// validInput(String val,int min,int max,type){
//   if(type == 'username'){
//     if(!GetUtils.isUsername(val)){
//       return "username is not valid";
//     }
//   } if(type == 'phone'){
//     if(!GetUtils.isPhoneNumber(val)){
//       return "Phone Number is not valid";
//     }
//   }
//
// if(type == 'password'){
//   if(val.length > max){
//     return "$maxPasswordMessage $max";
//   }
//   if(val.isEmpty){
//     return emptyInputMessage;
//   }
//   if(val.length < min){
//     return "$minPasswordMessage $min";
//   }
// }
//
//
// }
//
// noteValidInput(String val,int min,int max){
//   if(val.length > max){
//     return "$maxTextMessage $max";
//   }
//   if(val.isEmpty){
//     return emptyInputMessage;
//   }
//   if(val.length < min){
//     return "$minTextMessage $min";
//   }
//
//
// }
const String emptyInputMessage = "required!";
// const String minPasswordMessage = "password must be greater than";
// const String maxPasswordMessage = "password must be less than";
//
// const String minTextMessage = "text must be greater than ";
// const String maxTextMessage = "text must be less than ";