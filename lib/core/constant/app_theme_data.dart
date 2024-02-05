import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData aTheme = ThemeData(
  fontFamily: 'Cairo-Black',
  // primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,

  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: Color(0XFF797979),fontWeight: FontWeight.w400),
    // bodyMedium: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 15.h),
    // headline1:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22,),
    // headline2:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26,),
    // bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:  Color(0xFFFCFCFC)),
    // bodyText2: TextStyle(height: 2,fontWeight: FontWeight.bold,fontSize: 14,color:  Color(0xFFFCFCFC)),

  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  }),

);
ThemeData eTheme = ThemeData(
  fontFamily: 'play',
  visualDensity: VisualDensity.adaptivePlatformDensity,

  // primarySwatch: Colors.blue,
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: Color(0XFF797979),fontWeight: FontWeight.w400),
    // bodyMedium: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 15.h),

    // bodyMedium: TextStyle(color:Colors.white,fontWeight: FontWeight.normal,fontSize: 14.w),
    // bodySmall: TextStyle(color:Colors.white70,fontWeight: FontWeight.normal,fontSize: 12.w),

    //   headline1:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22,),
  //   headline2:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26,),
  //   bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:  Color(0xFFFCFCFC)),
  //   bodyText2: TextStyle(height: 2,fontWeight: FontWeight.bold,fontSize: 14,color:  Color(0xFFFCFCFC)),

  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  }),

);