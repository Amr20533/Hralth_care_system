import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/appointment/patient_details.dart';
import 'package:co_rhema/User/views/appointment/widgets/comment_box.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class DoctorReviewScreen extends StatelessWidget {
  const DoctorReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      // backgroundColor:const Color(0xFFFCFCFC),
      body: SizedBox(
        height: 825.h,
        width: 325.w,
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Container(
                height: 210.h,
                padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,opacity: 60,
                        image: AssetImage('assets/images/clinc01.jpg')
                    )
                ),
                child: Container(
                  padding:  EdgeInsets.only(top:15.h,right: 16.w),
                  width: 375.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),


                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width:double.infinity,
                  // height: 700.h,
                  margin:EdgeInsets.only(top:180.h) ,
                  padding: EdgeInsets.only(top:30.0.w,) ,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadiusDirectional.only(topStart:Radius.circular(26.w),topEnd:Radius.circular(26.w)),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 55.0.h,),
                      Text('Dr. Johnny Willson',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15.0.w),),
                      SizedBox(height: 8.0.h,),
                      Text('Dentist',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: Colors.grey),),
                      SizedBox(height: 30.0.h,),
                      Text('How was your experience with Jonny?',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14.0.w),),
                      SizedBox(height: 20.0.h,),
                      Divider(color: const Color(0XFF838383),height: 0.4.w,),
                      SizedBox(height: 20.0.h,),
                      Text('Your overall rating',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11.0.w,color: Colors.grey),),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0.w,top: 16.0.h),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(5, (index) => Container(
                                margin: EdgeInsets.only(right: 22.0.w),
                                child: Icon(AntDesign.star,color: kColorsLightYellow,size: 30.w,))),
                          ],),
                      ),
                      SizedBox(height: 25.0.h,),
                      Divider(color: const Color(0XFF838383),height: 0.4.w,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:5.0.w),
                            child: Text('Add detailed review',style:Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.0.w, fontWeight: FontWeight.w500,color: Colors.black ),),
                          ),
                          SizedBox(height: 10.h,),
                          CommentBox(width: 325.w,height: 80.w,hintText: 'Enter here',borderRadius: BorderRadius.circular(8.0.w),),
                        ],
                      ),)
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    // padding: EdgeInsets.all(15.0.w),
                    margin:EdgeInsets.only(top:140.h) ,
                    width: 105.w,height:105.w,
                    alignment: Alignment.center,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      // shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0.w),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 64.w,
                              backgroundImage:const AssetImage('assets/images/docs/m_doc_1.jpg'),),
                            Positioned(bottom: 8.w,right: 3.w,
                                child: Container(width: 19.w,height: 19.w,
                                  alignment: Alignment.center,
                                  decoration:const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(width: 18.w,height: 18.w,
                                      decoration:const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                      child: Icon(MaterialIcons.verified,color: myBlueColor,size: 18.w,)),
                                )),

                          ],
                        ),
                    )
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomButton(text: "Submit", onTap: (){},),

    );

  }
}
