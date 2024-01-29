import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/packages.dart';
import 'package:co_rhema/User/views/appointment/patient_details.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/package_card.dart';
import 'package:co_rhema/User/views/home/widgets/custom_bottom_button.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PackageScreen extends StatefulWidget {
  PackageScreen({Key? key}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  List<int> duration = [10,15,20,25,30,45];
  int selected = 0;
  int _selectDuration = 15;
  List<Package> package = Package.packages;

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
                  const CustomDocCard(title:"Select Package", icon: AntDesign.arrowleft,),
                  Padding(
                      padding: EdgeInsets.only(top:24.0.h,bottom: 18.0.h,),
                      child: Text('Select Duration',style: TextStyle(color: Colors.black,fontSize: 16.0.w,fontWeight: FontWeight.w500),),
                  ),
                  Container(
                    width: 325.w,height: 40.0.w,alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    margin: EdgeInsets.only(left: 5.0.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0.w),
                      border: Border.all(color: Colors.grey[400]!),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.watch_later,color: myBlueColor,),
                            SizedBox(width: 5.0.w,),
                            Text('$_selectDuration minutes',style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down,color: myBlueColor.withOpacity(0.7),size: 26.w,),
                          iconSize: 32,elevation: 4,
                          style: TextStyle(fontSize: 13.w,fontWeight: FontWeight.w400,color: Colors.black),
                          items: duration.map<DropdownMenuItem<String>>((int value){
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          underline: Container(height: 0,),
                          onChanged: (String? value) {
                            setState(() {
                              _selectDuration = int.parse(value!);
                            });
                          },

                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0.h,),
                    child: Text('Select Package',style: TextStyle(color: Colors.black,fontSize: 16.0.w,fontWeight: FontWeight.w500),),
                  ),
                  ListView.builder(
                    itemCount: package.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                    itemBuilder: (context,index) => PackageCard(onTap:(){
                      setState(() {
                        selected = index;
                      });
                    },text: package[index].text!,subText: package[index].subText!,icon: package[index].icon!,duration: package[index].duration!,price: package[index].price!,isSelected: index == selected ? true : false),
                  ),


                ]),
          ),),),
     bottomNavigationBar: CustomBottomButton(text: "Next",onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetails()));}),

    );

  }

}

