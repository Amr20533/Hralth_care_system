import 'package:co_rhema/User/views/handling_data_view.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/auth/login_controller.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/shares/style/icon_broken.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/favs/fav_screen.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/profile/help_screen.dart';
import 'package:co_rhema/User/views/profile/privacy_screen.dart';
import 'package:co_rhema/User/views/profile/settings_screen.dart';
import 'package:co_rhema/User/views/profile/user_profile.dart';
import 'package:co_rhema/User/views/profile/widgets/tiles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return SafeArea(
      child: GetBuilder<LoginControllerImp>(builder: (controller){
        return HandlingDataView(widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.0.w,top: 12.0.w),
              child: const CustomDocCard(deActivate: true,title:"Profile", icon: AntDesign.arrowleft,),
            ),
            Center(
              child: Stack(alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(width: 94.w,height: 94.w,
                    margin: EdgeInsets.only(top: 10.h),
                    child: CircleAvatar(
                      radius: 36.h,
                      backgroundImage:const NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
                      // backgroundImage: NetworkImage(image),
                    ),
                  ),
                  Positioned(bottom: 0,right: 2.w,
                      child: Container(width: 30.w,height: 30.w,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(width: 24.w,height: 24.w,
                            decoration:const BoxDecoration(
                                color: myBlueColor,
                                shape: BoxShape.circle
                            ),
                            child: Icon(MaterialIcons.edit,color: Colors.white,size: 14.w,)),
                      ))
                  // child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,))
                ],
              ),
            ),
            SizedBox(height: 30.h),

            Column(
                children: [
                  SizedBox(height: 10.h,),
                  Column(
                    children: [
                      TilesWidget(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
                      }, title: 'Your profile', leading: FontAwesome.user_o,

                      ),
                      TilesWidget(onTap:(){
                      },title: "Payment Method",leading: FontAwesome.credit_card,),
                      TilesWidget(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const FavScreen()));
                      },title: "Favorite",leading: Fontisto.heart_alt,),
                      TilesWidget(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                      },title: "Settings",leading: Icons.settings_outlined,),
                      TilesWidget(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
                      },title: "Help Center",leading: AntDesign.exclamationcircleo,),
                      TilesWidget(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyScreen()));
                      },title: "Privacy Policy",leading: Fontisto.locked,),
                      // },title: "Privacy Policy",leading: Fontisto.locked,),
                      TilesWidget(onTap:(){
                        _showBottomSheet(context);
                      },title: "Log out",leading: IconBroken.Logout,),
                    ],
                  ),
                ])
            /*Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),*/
          ],
        ), request: controller.statusRequest);
        },),
    );
     /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),*/
  /*    body: Stack(
        alignment: Alignment.center,
        children: [
    *//*      Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

*//**//*
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                      hintText: 'Username',
                    ),
                    textfield(
                      hintText: 'Email',
                    ),
                    textfield(
                      hintText: 'Password',
                    ),
                    textfield(
                      hintText: 'Confirm password',
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        // color: Colors.black54,
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
*//**//*
            ],
          ),*//*
          // CustomPaint(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //   ),
          //   painter: HeaderCurvedContainer(),
          // ),

        ],
      ),*/
    // );
  }
  Future<dynamic> _showBottomSheet(context){
    return showModalBottomSheet(context: context,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        barrierColor: Colors.black26,elevation: 0.0,isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.w))),
        builder: (context) => Container(
            padding:const EdgeInsets.symmetric(vertical: 10),
            height: 825.h * 0.28,
            // height: 825.h * 0.33,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16.w),topLeft: Radius.circular(14.w)),
            ),
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 2.7.w,width:95.w,margin: EdgeInsets.only(top: 2.0.h,bottom: 12.0.w,),
                      decoration:BoxDecoration(
                        color: kColorsLightGrey.withOpacity(0.2),
                      ),),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: Text('124'.tr,style: TextStyle(fontSize: 16.w,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    Container(height: 0.6.w,margin: EdgeInsets.symmetric(horizontal: 14.0.w,vertical: 3.h),
                      decoration:BoxDecoration(
                        color: kColorsLightGrey.withOpacity(0.4),
                      ),),
                    Padding(padding: EdgeInsets.only(top:16.h,bottom: 6.h),
                      child: Text('125'.tr,style:Theme.of(context).textTheme.titleMedium!.copyWith(color: const Color(0XFF7A7A7A),fontWeight: FontWeight.w400,fontSize: 14.w)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 22.0.h),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(alignment: Alignment.center,
                              width: 140.w,height: 45.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.w),
                                border: Border.all(color: const Color(0XFF0165FC).withOpacity(0.8),width: 2),
                              ),
                              child: Text('93'.tr,style:TextStyle(color: const Color(0XFF0165FC).withOpacity(0.8),fontSize: 14.w,fontWeight: FontWeight.w500)),
                            ),
                          ),
                          GetBuilder<LoginControllerImp>(builder: (controller){
                            return ChoiceButton(width: 140.w,height: 45.w,
                                text:'123'.tr,color: myBlueColor,tColor: Colors.white,onTap: (){
                                  controller.userLogout().then((loggedOut){
                                    if(loggedOut == true){
                                      Get.offAllNamed(AppRoutes.login);
                                      debugPrint("Successfully LoggedOut");
                                      Get.back();
                                    }else{
                                      debugPrint("Failed to Log out");
                                    }

                                  });

                                  // Navigator.pop(context);
                                });
                          })
                        ],),
                    )
                  ]),
            )
        ));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}