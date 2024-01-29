import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/review_controller.dart';
import 'package:co_rhema/User/views/appointment/appointment_screen.dart';
import 'package:co_rhema/User/views/appointment/package_screen.dart';
import 'package:co_rhema/User/views/favs/fav_screen.dart';
import 'package:co_rhema/User/views/home/reviews/doctor_reviews.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/custom_form_field.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/review_card.dart';
import 'package:co_rhema/User/views/home/widgets/special_circle.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class SpecialList{
  final String? ratings,review,cat,patients;
  final IconData? icon;
  final int? years;
  SpecialList({this.review,this.patients,this.years,this.icon,this.ratings,this.cat});
}
class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key,required this.phs}) : super(key: key);
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
      ),
    SpecialList(
      patients: '10+',
      years: 7,
      review: '4,956',
      cat: 'Years Exp.',
      icon: Icons.card_travel_sharp,
     ),
    SpecialList(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 12.0.w),
        child: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
        children: [
           IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
          const Spacer(flex: 3,),

          Text('Doctor Details',style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
          const Spacer(flex: 1,),
           IconCircle(onTap:(){},icon: Icons.share_sharp,),
          SizedBox(width: 6.w,),
          Container(width: 33.w,height: 33.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.0.w),
              border:Border.all(color: Colors.grey[300]!,width: 1),
            ),
            child: Center(child: SvgPicture.asset('assets/images/icons/heart-icon.svg',color: Colors.black54,width: 16.w,height: 16.w,)),
          ),
        ],),
        SizedBox(width: 325.w,height: 100.w,
        child: Row(
            children: [
              Stack(alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 45.h,
                    backgroundImage:AssetImage(phs.image),
                  ),
                  Positioned(bottom: 10.h,right: 0.0,
                      child: Container(width: 12.w,height: 12.w,
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                          // color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(MaterialIcons.verified,color: myBlueColor,size: 15.w,),
                      ))
                  // child: Icon(MaterialIcons.verified,color: myBlueColor,size: 14.w,))
                ],
              ),
/*
              Container(color: Colors.cyan,width: 55.w,height: 50.w,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45.h,
                      backgroundImage:AssetImage(phs.image),
                    ),
                    Positioned(bottom: 5,right: -2.0.w,
                      child: Icon(MaterialIcons.verified,color: myBlueColor,size: 18.w,))
                  ],
                ),
              ),
*/
              SizedBox(width: 7.w,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                children: [
                  Text(phs.title,style: categoryBarTitleStyle(context)),
                  SizedBox(height: 6.h,),
                  Text(phs.speciality,style: TextStyle(color:const Color(0XFF838383),fontSize: 15.h,fontWeight: FontWeight.w400),),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Icon(MaterialCommunityIcons.map_marker,color: myBlueColor,size: 16.w,),
                      SizedBox(width: 3.w,),
                      Text(phs.location,style: TextStyle(color:const Color(0XFF797979),fontSize: 16.h,fontWeight: FontWeight.w400),),
                      SizedBox(width: 5.w,),
                      Icon(MaterialCommunityIcons.map,color: myBlueColor,size: 16.w,),

                    ],
                  ),

                ],
              )
            ],
          ),

        ),
        Divider(color: const Color(0XFF838383),height: 0.6.w,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0.h,),
          child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpecialCircle(width: 40.w,height: 40.w,child: Icon(MaterialIcons.people,color: myBlueColor,size: 26.h,)),
                  SizedBox(height: 5.0.h,),
                  Text('7,500+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                  SizedBox(height: 7.0.h,),
                  Text('Patients',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),
                ],
              ),
              Column(
                children: [
                  SpecialCircle(width: 40.w,height: 40.w,child: Icon(MaterialIcons.people,color: myBlueColor,size: 26.h,)),
                  SizedBox(height: 5.0.h,),
                  Text('10+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                  SizedBox(height: 7.0.h,),
                  Text('Years Exp.',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                ],
              ),
              Column(
                children: [
                  SpecialCircle(width: 40.w,height: 40.w,child: Icon(MaterialIcons.star,color: myBlueColor,size: 26.h,)),
                  SizedBox(height: 5.0.h,),
                  Text('4.9+',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                  SizedBox(height: 7.0.h,),
                  Text('Rating',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                ],
              ),
              Column(
                children: [
                  SpecialCircle(width: 40.w,height: 40.w,child: Icon(MaterialIcons.rate_review,color: myBlueColor,size: 26.h,)),
                  SizedBox(height: 5.0.h,),
                  Text('4,956',style: TextStyle(color: myBlueColor,fontSize: 15.w,fontWeight: FontWeight.w600),),
                  SizedBox(height: 7.0.h,),
                  Text('Reviews',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),

                ],
              ),
            ],
          )
        ),
        SizedBox(height:3.h),
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
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorReviewScreen()));

                      // controller.goToDoctorReview();
                    },
                    child: Row(
                      children: [
                        const Icon(MaterialCommunityIcons.note_edit,color: myBlueColor),
                        Text(' Add review',style: TextStyle(color:myBlueColor,fontSize: 15.h,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ],),
            );
          }),


          GetBuilder<ReviewControllerImp>(builder: (controller) {
            return CustomFormField(
            controller: controller.reviewsController,
            hintText: "Search in reviews",
            borderRadius: BorderRadius.circular(12.0.w),
            width: 325.w,height: 40.w,
            focusBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: myBlueColor, width: 2.0),
            borderRadius: BorderRadius.circular(12.0.w),
            ),
              prefixIcon:const Icon(AntDesign.search1,color: myBlueColor,));
          }),
            GetBuilder<ReviewControllerImp>(builder: (controller){
              return Container(width: 66.w,height: 28.h,
                  padding: EdgeInsets.only(left:8.h),
                  margin: EdgeInsets.only(top:14.h,bottom:14.h),
                  decoration: BoxDecoration(
                    color: const Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.w),
                    border:Border.all(color:Colors.black54,width: 1),
                  ),
                  child:GestureDetector(
                    onTap: (){
                      controller.goToFilterScreen();
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(AntDesign.filter,color: Colors.black,size: 7.w,),
                        // Icon(AntDesign.menu_fold,color: Colors.black,size: 7.w,),
                        SizedBox(width: 3.w,),
                        Text('Filter',style: TextStyle(color: Colors.black,fontSize: 14.h,fontWeight: FontWeight.w500),),
                        SizedBox(width: 1.w,),
                        Icon(MaterialIcons.arrow_drop_down,color: Colors.black,size: 16.w,),

                      ],
                    ),
                  )
              );
            }),
          Divider(color: const Color(0XFF838383),height: 0.6.w,),
          // SizedBox(height: 15.h,),
          // const UserReviews(username: "Dale Thiel", date: "11 month ago",follower: '45 followers', ratings: 5.0, image: "assets/images/user_1.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),
          // const UserReviews(username: "Tiffany Nitzsche", date: "11 month ago",follower: '1.5 followers', ratings: 5.0, image: "assets/images/user_2.jpg", comment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"),

          const ReviewCard(username: 'Dela Thiel',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'assets/images/user_1.jpg',),
          Divider(color: const Color(0XFF838383),height: 0.6.w,),
          const ReviewCard(username: 'Tiffany Nitzsche',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'assets/images/user_2.jpg',),
  // const ReviewCard(username: 'Dela Thiel',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'https://cdn1.picuki.com/hosted-by-instagram/q/0exhNuNYnjBcaS3SYdxKjf8fx+9wWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYzxl54woWFpYAz17PkXWQbGLSjhd6a+YVOilvDFg%7C%7CZ9mkL00KXMbZ3Wn9MMvV2GpNWwSDv5PHK6oqf1UvLvjOHVBu2nSY9sXm2MUjs2nZ6phl4Ij7ayThUXxpp0oPmwHoyUiIEchrM7Oqz0YXfm+McF54555RYgPi9NYur+%7C%7C3Rq2ElIlc20jPCLPrI7Zur0boxbJTG0U3HWYSu8+K0FDoHe2nTchk64PqaSDco5u26Nv%7C%7CPWRRWE4XG1orxFRm5Gkyg7XTXmH63oB7VTUk52rda0IkryiCPm4T%7C%7CXIiXLkK+L6WukBXnkNV7GDFVDUfaXmOOlfsp1hKccZ70ujolC5OYre1UBGEg19uwKfCJ1ZVsmllPajp3j81DWb9l8Yn8v9dLYBngsLoZyouFU9RnLFOttGP2nUjQEkF9g=.jpeg',),
  //         Divider(color: const Color(0XFF838383),height: 0.6.w,),
  //         const ReviewCard(username: 'Tiffany Nitzsche',date: '11 months ago',ratings:5.0,comment: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',image: 'https://cdn1.picuki.com/hosted-by-instagram/q/0exhNuNYnjBcaS3SYdxKjf8fx+9wWgxSZ60STLepjSVmIR1vLHOapZA0mpCj4yRwKwVlASuRYzxl4o8qWFxWCT14OkPdS7aLRTpd56SfUevN0jxm8pdplL81K3MfZn6q98UrOzjYMTIfQeoVUvyz7a9X9a+tKCtf5mT9YbdHjglcsvysTP9myZ4u9qeJlAb88p5gaWwE8W8vLUc7ttzduDsHEvf%7C%7CP4hLq6JIRbYY15ZVuanRlSaHHmUpJjdWPWLIt8bGnLkApBuweDkg9lHhQq02cm08jH+apzcTk60PqcOhN48wjrNt96nQc2UGXGRumB9ricmQjQbXRlSuxm1I6nn+2IrgX9oT9brUIuSzQp666GSTSv+MWbhPXy1CVbrZWwKMcMqXAelRxKgbN61b5XecwhyeRYXdiSt0UTQZiguhOIB0Suqe7K2PqyGD1AeCtjAa1sO+JuUJngsP0+Gurzl1ekPVDMwSOWCH31Uk.jpeg',),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 200.w,
            child: ListView.separated(itemBuilder: (context,index)=>ClipRRect(
              borderRadius: BorderRadius.circular(12.w),
              child: Container(
                width: 200.w,height: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: CachedNetworkImage(imageUrl: cl[index],fit: BoxFit.cover,),
              ),
            ),shrinkWrap: true, physics: const BouncingScrollPhysics(),scrollDirection: Axis.horizontal, separatorBuilder: (context,index)=> SizedBox(width:10.w), itemCount: cl.length),
          ),
          SizedBox(height: 10.h,),
          //   Padding(
        //   padding: EdgeInsets.symmetric(vertical: 18.0.h,),
        //   child:
        //   Wrap(direction: Axis.horizontal,
        //     children: [
        //       ...List.generate(physicians.length, (index) => Padding(
        //         padding: EdgeInsets.only(right: 14.0.w),
        //         child: Column(
        //           children: [
        //           SpecialCircle(width: 40.w,height: 40.w,child: Icon(physicians[index].icon,color: myBlueColor,size: 26.h,)),
        //             SizedBox(height: 5.0.h,),
        //             Text('${physicians[index].patients}',style: TextStyle(color: myBlueColor,fontSize: 14.w,fontWeight: FontWeight.w500),),
        //             SizedBox(height: 7.0.h,),
        //             Text('${physicians[index].cat}',style: TextStyle(color: const Color(0XFF838383),fontSize: 12.w,fontWeight: FontWeight.w500),),
        //
        //           ],
        //         ),
        //       ))
        //     ],
        //   ),
        // )

    ]),
    ),),),
      bottomNavigationBar: CustomBottomButton(text:'126'.tr,onTap:(){   Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(phs: phs,)));}),

      // bottomNavigationBar: Container(width: double.infinity,
      // height: 70.w,alignment: Alignment.center,
      // decoration: BoxDecoration(color: Colors.white,
      //   boxShadow: [BoxShadow(
      //     blurRadius: 10,offset:const Offset(-4,-4),
      //     color:const Color(0XFF797979).withOpacity(0.1),
      //   )],
      // borderRadius: BorderRadius.only(topRight: Radius.circular(14.w),topLeft: Radius.circular(14.w))),
      // child:GestureDetector(
      //   onTap: (){
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentScreen(phs: phs,)));
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) => FavScreen()));
      //   },
      //   child: Container(width: 290.w,height: 40.w,
      //     // margin: EdgeInsets.symmetric(horizontal: 7.w),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: myBlueColor,
      //       borderRadius: BorderRadius.circular(20.0.h),
      //     ),
      //     child: Center(
      //       child: Text('Book Appointment',style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
      //     ),
      //   ),
      // ) ,),
    );
  }
}


