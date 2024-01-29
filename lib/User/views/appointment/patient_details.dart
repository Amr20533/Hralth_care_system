import 'package:co_rhema/User/views/appointment/add_card_screen.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/dropped_card.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'widgets/comment_box.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  String _booking = "Self";
  List<String> bookingList = ["Self","Family","Others","Individual"];
  String _selectedGender = "None";
  List<String> genderList = ["Male","Female"];
  int _selectedAge = 24;
  List<int> ageList = [22,24,28,32,36,40,42];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDocCard(title:"Patient Details", icon: AntDesign.arrowleft,),
                  Padding(
                    padding: EdgeInsets.only(top:24.0.h,bottom: 10.0.h,left: 5.0.w),
                    // padding: EdgeInsets.only(left: 4.0.w,top: 10.h,bottom: 5.h,),

                    child: Text('Booking for',style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                  ),
                  DroppedCard(text: _booking,
                    items: bookingList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child:Text(value) );
                    }).toList(),
                    onChanged: (String? value){
                    setState(() {
                      _booking = value!;
                    });
                  },),
                  Padding(
                    padding: EdgeInsets.only(top:14.0.h,bottom: 10.0.h,left: 5.0.w),
                    child: Text('Gender',style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                  ),
                  DroppedCard(text: _selectedGender,
                    items: genderList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                          value: value,
                          child:Text(value) );
                    }).toList(),
                    onChanged: (String? value){
                    setState(() {
                      _selectedGender = value!;
                    });
                  },),
                  Padding(
                    padding: EdgeInsets.only(top:14.0.h,bottom: 10.0.h,left: 5.0.w),
                    child: Text('Your Age',style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                  ),
                  DroppedCard(text: '$_selectedAge Years',
                    items: ageList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                          value: value.toString(),
                          child:Text(value.toString()) );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedAge = int.parse(value!);
                      });
                  },),
                  Padding(
                    padding: EdgeInsets.only(top:14.0.h,bottom: 10.0.h,left: 5.0.w),
                    child: Text('Write in Your Problem',style: TextStyle(color: Colors.black87,fontSize: 12.0.w,fontWeight: FontWeight.normal),),
                  ),
                  CommentBox(width: 325.w,height: 200.w,hintText: 'Write here...',borderRadius: BorderRadius.circular(6.0.w),),

                ]),
          ),),),
      bottomNavigationBar: CustomBottomButton(text: "Next",onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddCardScreen()));
      }),

      // bottomNavigationBar: Container(width: double.infinity,
      //   height: 70.w,alignment: Alignment.center,
      //   decoration: BoxDecoration(color: Colors.white,
      //       boxShadow: [BoxShadow(
      //         blurRadius: 10,offset:const Offset(-4,-4),
      //         color:const Color(0XFF797979).withOpacity(0.1),
      //       )],
      //       borderRadius: BorderRadius.only(topRight: Radius.circular(14.w),topLeft: Radius.circular(14.w))),
      //   child:GestureDetector(
      //     onTap: (){
      //       /// the right route
      //       // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardScreen()));
      //     },
      //     child: Container(width: 290.w,height: 40.w,
      //       // margin: EdgeInsets.symmetric(horizontal: 7.w),
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: myBlueColor,
      //         borderRadius: BorderRadius.circular(20.0.h),
      //       ),
      //       child: Center(
      //         child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
      //       ),
      //     ),
      //   ) ,),
    );
  }
}
