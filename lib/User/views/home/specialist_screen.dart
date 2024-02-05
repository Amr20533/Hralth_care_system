import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialistScreen extends StatelessWidget {
  SpecialistScreen({Key? key}) : super(key: key);
  List<Specialist> phs = Specialist.physicians;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h,left: 5.0.w),
          child: Row(
            children: [
              Text('Specialist',style: TextStyle(color: Colors.black,fontSize: 18.0.w,fontWeight: FontWeight.w400),),
              SizedBox(width: 5.0.w,),
              Text('(18)',style: TextStyle(color: myBlueColor.withOpacity(0.9),fontSize: 16.0.w,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: phs.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
            itemBuilder: (context,index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: SpecialistCard(favTap:(){},
                onTap:(){    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(receivedData:phs[index], tabIndex: index,)));},receivedData: phs[index], verified: Icons.verified,
                child: SizedBox(width: 25.w,height: 25.w,
                  child: SvgPicture.asset('assets/images/icons/heart.svg',color: myBlueColor,),),
              ),
            ),
            separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
          ),
        ),
          // SizedBox(height: 50.h,)
      ],
    );
  }
}
