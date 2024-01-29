import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/reviews/filter_screen.dart';
import 'package:co_rhema/User/views/home/reviews/hospital_reviews.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key, this.phs}) : super(key: key);
  final dynamic phs;
  final List<String> cl = [
    'https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=2053&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1580281657702-257584239a55?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fHw%3D',
    'https://images.unsplash.com/photo-1559000357-f6b52ddfbe37?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fGhvc3BpdGFsfGVufDB8fDB8fHww'
  ];
  final List<String> week = ['Monday','Tuesday', 'Wednesday','Thursday','Friday','Saturday','Sunday'];
  static List<SpecialList> physicians =[SpecialList(
    patients: '7,500+',
    years: 10,
    review: '4,956',
    cat: 'Patients',
    icon: MaterialIcons.people,
  ), SpecialList(
    patients: '10+',
    years: 7,
    review: '4,956',
    cat: 'Years Exp.',
    icon: Icons.card_travel_sharp,
  ), SpecialList(
    patients: '4,695',
    years: 7,
    review: '4,695',
    cat: 'Rating',
    icon: MaterialIcons.star,
  ),
    SpecialList(
      patients: '4,956',
      years: 6,
      review: '4,643',
      cat: 'Review',
      icon: MaterialIcons.comment,
    ),
  ];
  final TextEditingController reviewsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0.h),
            child: Text('About',style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
          ),
          ExpandableText('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',
            animation: true,animationCurve: Curves.easeIn,animationDuration: const Duration(milliseconds: 200),
            collapseOnTextTap: true,
            expandText: 'Show More',collapseText: "Show Less",style: TextStyle(fontSize: 13.w,fontWeight: FontWeight.w400),),


          SizedBox(height:18.h),
          Text('Working Hours',style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
          SizedBox(height:5.h),
          Container(color: const Color(0XFF838383),height: 0.6.w,),
          SizedBox(height: 5.h,),
          ...List.generate(week.length, (index) => Padding(
            padding: EdgeInsets.only(bottom:8.0.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(week[index],style: TextStyle(color:const Color(0XFF838383),fontSize: 16.h,fontWeight: FontWeight.w400),),
                Text('00:00 - 00:00',style: TextStyle(color:Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),),
              ],),
          ),),
          Padding(
            padding: EdgeInsets.only(top: 20.0.h,bottom:5.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Address',style: TextStyle(color:Colors.black,fontSize: 18.h,fontWeight: FontWeight.w600),),
                Text('View on Map',style: TextStyle(color:myBlueColor,fontSize: 15.h,fontWeight: FontWeight.w500),),

              ],),
          ),
          Divider(color: const Color(0XFF838383),height: 0.6.w,),
          SizedBox(height: 3.h,),
          Row(
            children: [
              Icon(MaterialCommunityIcons.map_marker_outline,color: myBlueColor,size: 18.w,),
              SizedBox(width: 5.w,),
              Text(phs.address,style: TextStyle(color:const Color(0XFF797979),fontSize: 16.h,fontWeight: FontWeight.w400,fontFamily: 'Cairo-Black'),),
            ],
          ),
          SizedBox(height: 5.h,),
          Container(
            width: 325.w,height: 180.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                image:const  DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage('assets/images/location.jpg'),
                )
            ),
          ),
          GetBuilder<ReviewControllerImp>(builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0.h,bottom:5.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Reviews',style: TextStyle(color:Colors.black,fontSize: 20.h,fontWeight: FontWeight.w600,fontFamily: 'Cairo-Black'),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalReviewScreen()));
                      // controller.goToHospitalReview();
                    },
                    child: Row(
                      children: [
                        const Icon(MaterialCommunityIcons.note_edit,color: myBlueColor),
                        Text('75'.tr,style: TextStyle(color:myBlueColor,fontSize: 15.h,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],),
            );

          }),
          CustomFormField(
              controller: reviewsController,
              hintText: "Search in reviews",
              borderRadius: BorderRadius.circular(12.0.w),
              width: 325.w,height: 40.w,
              focusBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: myBlueColor, width: 2.0),
                borderRadius: BorderRadius.circular(12.0.w),
              ),
              prefixIcon:const Icon(AntDesign.search1,color: myBlueColor,)),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
            },
            child: Container(width: 66.w,height: 28.h,
                padding: EdgeInsets.only(left:8.h),
                margin: EdgeInsets.only(top:14.h,bottom:14.h),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(12.w),
                  border:Border.all(color:Colors.black54,width: 1),
                ),
                child:Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(AntDesign.menu_fold,color: Colors.black,size: 7.w,),
                    SizedBox(width: 3.w,),
                    Text('Filter',style: TextStyle(color: Colors.black,fontSize: 14.h,fontWeight: FontWeight.w500),),
                    SizedBox(width: 1.w,),
                    Icon(MaterialIcons.arrow_drop_down,color: Colors.black,size: 16.w,),

                  ],
                )
            ),
          ),
          // Divider(color: const Color(0XFF838383),height: 0.6.w,),
          // // SizedBox(height: 15.h,),
          // const ReviewCard(username: 'Dela Thiel',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'https://cdn1.picuki.com/hosted-by-instagram/q/0exhNuNYnjBcaS3SYdxKjf8fx+9wWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYzxl54woWFpYAz17PkXWQbGLSjhd6a+YVOilvDFg%7C%7CZ9mkL00KXMbZ3Wn9MMvV2GpNWwSDv5PHK6oqf1UvLvjOHVBu2nSY9sXm2MUjs2nZ6phl4Ij7ayThUXxpp0oPmwHoyUiIEchrM7Oqz0YXfm+McF54555RYgPi9NYur+%7C%7C3Rq2ElIlc20jPCLPrI7Zur0boxbJTG0U3HWYSu8+K0FDoHe2nTchk64PqaSDco5u26Nv%7C%7CPWRRWE4XG1orxFRm5Gkyg7XTXmH63oB7VTUk52rda0IkryiCPm4T%7C%7CXIiXLkK+L6WukBXnkNV7GDFVDUfaXmOOlfsp1hKccZ70ujolC5OYre1UBGEg19uwKfCJ1ZVsmllPajp3j81DWb9l8Yn8v9dLYBngsLoZyouFU9RnLFOttGP2nUjQEkF9g=.jpeg',),
          // Divider(color: const Color(0XFF838383),height: 0.6.w,),
          // const ReviewCard(username: 'Tiffany Nitzsche',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'https://cdn1.picuki.com/hosted-by-instagram/q/0exhNuNYnjBcaS3SYdxKjf8fx+9wWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYzxl4o8qWFxWCT14OkPdS7aLRTpd56SfUevN0jxm8pdplL81K3MfZn6q98UrOzjYMTIfQeoVUvyz7a9X9a+tKCtf5mT9YbdHjglcsvysTP9myZ4u9qeJlAb88p5gaWwE8W8vLUc7ttzduDsHEvf%7C%7CP4hLq6JIRbYY15ZVuanRlSaHHmUpJjdWPWLIt8bGnLkApBuweDkg9lHhQq02cm08jH+apzcTk60PqcOhN48wjrNt96nQc2UGXGRumB9ricmQjQbXRlSuxm1I6nn+2IrgX9oT9brUIuSzQp666GSTSv+MWbhPXy1CVbrZWwKMcMqXAelRxKgbN61b5XecwhyeRYXdiSt0UTQZiguhOIB0Suqe7K2PqyGD1AeCtjAa1sO+JuUJngsP0+Gurzl1ekPVDMwSOWCH31Uk.jpeg',),
          // SizedBox(height: 10.h,),
          // SizedBox(
          //   height: 200.w,
          //   child: ListView.separated(itemBuilder: (context,index)=>Container(
          //     width: 200.w,height: 200.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16.w),
          //     ),
          //     child: CachedNetworkImage(imageUrl: cl[index],fit: BoxFit.cover,),
          //   ),shrinkWrap: true, physics: const BouncingScrollPhysics(),scrollDirection: Axis.horizontal, separatorBuilder: (context,index)=> SizedBox(width:10.w), itemCount: cl.length),
          // )

        ],
      ),
    );
  }
}
