import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TopSpecialistScreen extends StatefulWidget {
  const TopSpecialistScreen({required this.phs,Key? key}) : super(key: key);
  final dynamic phs;
  @override
  State<TopSpecialistScreen> createState() => _TopSpecialistScreenState();
}

class _TopSpecialistScreenState extends State<TopSpecialistScreen> {
  final List<String> _topList = ["All", "Dentist","Cardiologist","Neurologist","Alchoholist"];
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child:SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 15.0.w),
        child: Row(
        children: [
        IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
        const Spacer(flex: 3,),

        Text('Top Specialist',style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
        const Spacer(flex: 3,),
        IconCircle(onTap:(){},icon: AntDesign.search1,),
        ],),
        ),
        // SizedBox(height: 18.w,),
          Padding(
            padding: EdgeInsets.only(left:8.0.w),
            child:SizedBox(height: 55.h,
              child: ListView.builder(
                itemCount: _topList.length,scrollDirection: Axis.horizontal,padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),shrinkWrap: true,
                itemBuilder: (context,index) => GestureDetector(
                  onTap: (){
                    selected = index;
                    setState(() {});
                  },
                  child: Container(height: 30.h,
                      padding: EdgeInsets.only(left:14.h,right:14.h,top: 6.0.h,bottom: 5.0.h,),
                      margin: EdgeInsets.only(top:7.h,bottom:14.h,left: 8.w),
                      decoration: BoxDecoration(
                        color: selected == index ? myBlueColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(14.w),
                        border:Border.all(color:const Color(0XFF838383).withOpacity(0.3),width: 1),
                      ),
                      child:Text(_topList[index],style: TextStyle(color: selected == index ? Colors.white : Colors.black,fontSize: 16.h,fontWeight: FontWeight.w400),)
                  ),
                ),
              ),
            ),

          ),
          ListView.separated(
            itemCount: widget.phs.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
            itemBuilder: (context,index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0.w),
              child: SpecialistCard(favTap:(){},
                  onTap:(){    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(phs:widget.phs[index] ,)));},phs: widget.phs[index], verified: Icons.verified,
              child: SizedBox(width: 25.w,height: 25.w,
                child: SvgPicture.asset('assets/images/icons/heart.svg',color: myBlueColor,),),
          ),
            ),
            separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
          ),
        ]),
        ),
    ),);
  }
}
