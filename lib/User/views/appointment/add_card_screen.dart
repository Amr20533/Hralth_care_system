import 'package:co_rhema/User/views/appointment/review_summary_screen.dart';
import 'package:co_rhema/User/views/handling_data_view.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/profileController.dart';
import 'package:co_rhema/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: HandlingDataView(request: ctrl.statusRequest,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for(int i = 0; i < ctrl.data.length; i++)...[
                    if(ctrl.data[i]['id'] == ctrl.getUserId())...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w,vertical: 10.h),
                        child: Row(
                          children: [
                            IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                            const Spacer(flex: 4,),

                            Text('185'.tr,style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                            const Spacer(flex: 6,),
                          ],),
                      ),
                      Container(
                        margin:EdgeInsets.only(top:18.0.h,bottom: 10.0.h),
                        width: 325.w,height: 170.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0.w),
                          // image:const DecorationImage(fit: BoxFit.cover,
                          //   image: AssetImage('assets/images/icons/visa.jpg'),
                          // )
                        ),
                        child: Stack(
                          children: [
                            SvgPicture.asset(ImageAsset.visaMain),
                            Positioned(bottom: 45.h,left: 135.w,
                                child: Text(ctrl.data[i]['name'],style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 12.w),)),
                            Positioned(bottom: 25.h,left: 135.w,
                                child: Text('4716 9627 1963 8047',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontSize: 12.w),)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:13.0.h,bottom: 10.0.h,left: 5.0.w),
                        child: Text('186'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                      ),
                      Container(
                        width: 325.w,height: 38.w,alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        // margin: EdgeInsets.only(left: 5.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.w),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child:TextFormField(
                          decoration: InputDecoration(
                            hintText: ctrl.data[i]['name'],
                            hintStyle: TextStyle(color: const Color(0XFF797979).withOpacity(0.7)),
                            border: InputBorder.none,
                          ),
                        ),),
                      Padding(
                        padding: EdgeInsets.only(top:13.0.h,bottom: 10.0.h,left: 5.0.w),
                        child: Text('187'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                      ),
                      Container(
                        width: 325.w,height: 38.w,alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        // margin: EdgeInsets.only(left: 5.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0.w),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child:TextFormField(
                          decoration:  InputDecoration(
                            hintText: '4716 9627 19635 8047',
                            hintStyle: TextStyle(color: const Color(0XFF797979).withOpacity(0.7)),
                            border: InputBorder.none,
                          ),
                        ),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top:13.0.h,bottom: 10.0.h,left: 5.0.w),
                                  child: Text('188'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                  // margin: EdgeInsets.only(left: 5.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0.w),
                                    border: Border.all(color: Colors.grey[400]!),
                                  ),
                                  child:TextFormField(
                                    decoration:  InputDecoration(
                                      hintText: '02/30',
                                      hintStyle: TextStyle(color: const Color(0XFF797979).withOpacity(0.7)),
                                      border: InputBorder.none,
                                    ),
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(width: 14.0.w,),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top:13.0.h,bottom: 10.0.h,left: 5.0.w),
                                  child: Text('189'.tr,style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                                  // margin: EdgeInsets.only(left: 5.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0.w),
                                    border: Border.all(color: Colors.grey[400]!),
                                  ),
                                  child:TextFormField(
                                    decoration:  InputDecoration(
                                      hintText: '000',
                                      hintStyle: TextStyle(color: const Color(0XFF797979).withOpacity(0.7)),
                                      border: InputBorder.none,
                                    ),
                                  ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0.w),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: myBlueColor,
                                // buttonTheme: ButtonThemeData(buttonColor: myBlueColor)
                              ),
                              child: Checkbox(
                                activeColor: myBlueColor,
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Text('190'.tr,style: TextStyle(color: Colors.black87,fontSize: 16.0.w,fontWeight: FontWeight.w400),),
                          ],),
                      ),
                    ]
                  ],


                ]),
          ),),)),
      bottomNavigationBar: CustomBottomButton(text:'126'.tr,onTap:(){  Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewSummaryScreen()));}),

/*
      bottomNavigationBar: Container(width: double.infinity,
        height: 70.w,alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [BoxShadow(
              blurRadius: 10,offset:const Offset(-4,-4),
              color:const Color(0XFF797979).withOpacity(0.1),
            )],
            borderRadius: BorderRadius.only(topRight: Radius.circular(14.w),topLeft: Radius.circular(14.w))),
        child:GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewSummaryScreen()));
          },
          child: Container(width: 290.w,height: 40.w,
            // margin: EdgeInsets.symmetric(horizontal: 7.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: myBlueColor,
              borderRadius: BorderRadius.circular(20.0.h),
            ),
            child: Center(
              child: Text('Add Card',style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
            ),
          ),
        ) ,),
*/
    );
  }
}
