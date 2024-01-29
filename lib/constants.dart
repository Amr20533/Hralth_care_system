import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
const kTextColor = Color(0xFF3c4846);
const kTextMediumColor = Color(0xFF53627c);
const kTextLightColor = Color(0xFFACB1Cc);
const kPrimaryColor = Color(0xFF0c9869);
const kBackgroundColor = Color(0xFFF9F8FD);
const kInactiveColor = Color(0xFFEAECEF);
const double kDefaultPadding = 20.0;


const Color kColorsLightBlue100 = Color(0xFFDBEAFE);
const Color myGreyColor = Color(0xFFFCFCFC);
const Color kColorsGray100 = Color(0xFFDBEAFE);
const Color kColorsLightGrey = Color(0XFF838383);
const Color kColorsLightYellow = Color(0xFFFCAF23);
const Color kColorsLightBlue200 = Color(0xFF81D4FA);
const Color kColorsLightBlue300 = Color(0xFF4FC3F7);
const Color kColorsLightBlue400 = Color(0xFF29B6F6);
const Color kColorsLightBlue = Color(0xFF03A9F4);
const Color kColorsLightBlue500 = Color(0xFF03A9F4);
const Color kColorsLightBlue600 = Color(0xFF039BE5);
const Color kColorsLightBlue700 = Color(0xFF0288D1);
const Color kColorsLightBlue800 = Color(0xFF0277BD);
const Color kColorsLightBlue900 = Color(0xFF0858D1);
const Color myBlueColor = Color(0xFF0165FC);

///Doctor Home Page Colors
const Color kDocColorsLightGrey = Color(0xFFF8F8F8);
const Color kDocColorsDarkBlue = Color(0xFF0165FC);
const Color kDocGradientBeginColor = Color(0xFFA1EFF1);
const Color kDocGradientBeginDarkColor = Color(0xFFB4C4E0);
const Color kDocGradientEndColor = Color(0xFFD1BDEB);
const Color kDocGradientEndDarkColor = Color(0xFFDDA4E8);
const Color kDocContainerColor = Color(0xFFE4E8F6);
const Color kDocSecContainerColor = Color(0xFFE9E2F6);
const Color kDocArrowGreenColor = Color(0xFF259425);
const Color kDocCircularGreenColor = Color(0xFFC4E1E0);
const Color kDocBorderGreenColor = Color(0xFF9ACDCB);
const Color kDocArrowLightGreenColor = Color(0xFFDFFDDD);
const Color kDocLightGreenTextColor = Color(0xFF2D949A);
const Color kDocArrowRedColor = Color(0xFFE45959);
const Color kDocArrowLightRedColor = Color(0xFFFBC3C3);
const Color kDocCircularLightRedColor = Color(0xFFFDDDED);
const Color kDocBorderLightRedColor = Color(0xFFFCBADA);
const Color kDocDarkRedTextColor = Color(0xFFFA89C0);
const Color kDocWhiteColor = Color(0xFFFFFFFF);
const Color kDocPrimaryColor = Color(0xFF3E36B0);
const Color kDocSearchBarColor = Color(0xFFE5E5E5);
const Color kDocActiveIconColor = Color(0xFFEBD1EA);
final Color kShadowColor = const Color(0xFFD3D3D3).withOpacity(.84);
///Background
// const LinearGradient kDocGradientColor = LinearGradient(colors: [Color(0XFFEFBCD4),Color(0XFFCAC0F9),Color(0XFF6CCEE2)],begin: AlignmentDirectional.topCenter,end: AlignmentDirectional.bottomCenter,);
const LinearGradient kDocGradientColor = LinearGradient(
  colors: [Color(0xFFFBBAC7), Color(0xFFCAC0F9), Color(0xFF6CCEE2)],
  begin: AlignmentDirectional.topCenter,
  end: AlignmentDirectional.bottomCenter,
);
/// Circle Gradient
const LinearGradient kDocSecGradientColor = LinearGradient(colors: [Color(0XFF58B6DD),Color(0XFF4762BF)],begin: Alignment.centerLeft,end: Alignment.centerRight,);
/// Card Gradient
const LinearGradient kDocCardGradientColor = LinearGradient(colors: [Color(0xFF9DF2F2),Color(0xFFE09CE7)],begin: AlignmentDirectional.centerStart,end: AlignmentDirectional.centerEnd,);




TextStyle appStyle(double size,Color color,FontWeight fw){
  return GoogleFonts.poppins(fontSize: size.sp,color: color,fontWeight: fw);
}
TextStyle appStyleWithHeight(double size,Color color,FontWeight fw,double height){
  return GoogleFonts.poppins(fontSize: size.sp,color: color,fontWeight: fw,height: height);
}
TextStyle categoryBarStyle(context){
  return Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15.w);
}
TextStyle categoryBarTitleStyle(context){
  return Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 13.w);
}
TextStyle categoryBarSuffixStyle(context){
  return Theme.of(context).textTheme.titleMedium!.copyWith(fontSize:11.w,color:Colors.blue,fontWeight: FontWeight.w500);
}
List<BoxShadow> customBoxShadow(double blurRadius,Color color,double offset){
  return [BoxShadow(
  color: color,
  offset: Offset(-offset,-offset),
  blurRadius: blurRadius
  ),BoxShadow(
  color: color,
  offset: Offset(offset,offset),
  blurRadius: blurRadius
  )];
}