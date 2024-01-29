import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavDoctorScreen extends StatelessWidget {
  const FavDoctorScreen({Key? key,required this.phs}) : super(key: key);
  final dynamic phs;
  static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: ListView.separated(
        itemCount: phs.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
        itemBuilder: (context,index) => SpecialistCard(favTap:(){
          _showBottomSheet(context);
        },
            onTap:(){    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(phs:phs[index] ,)));},phs: phs[index], verified: verified,
            child:SvgPicture.asset('assets/images/icons/heart.svg',color: myBlueColor,)),
        separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
      ),
    );
  }

  Future<dynamic> _showBottomSheet(context){
    return showModalBottomSheet(context: context,
        isScrollControlled: false,
        backgroundColor: Colors.white,
        barrierColor: Colors.black26,elevation: 0.0,isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(26.0.w))),
        builder: (context) => Container(
            padding:const EdgeInsets.symmetric(vertical: 10),
            height: 825.h * 0.4,width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(26.w),topLeft: Radius.circular(26.w)),
            ),
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.h),
                      child: Text('Remove from Favorite?',style: TextStyle(fontSize: 16.w,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    Container(height: 1.0.w,margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                      decoration:BoxDecoration(
                        color: kColorsLightGrey.withOpacity(0.6),
                      ),),
                    Container(
                      padding: EdgeInsets.fromLTRB(12.0.w,20.0.w,12.0.w,28.0.w,),
                      decoration: BoxDecoration(
/*
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38.withOpacity(0.1), //color of shadow
                              blurRadius: 7.0, //spread radius
                              offset:const Offset(-4, -4),),
                      BoxShadow(
                              color: Colors.black38.withOpacity(0.1), //color of shadow
                              blurRadius: 7.0, //spread radius
                              offset:const Offset(4, 4),),
                          ], // changes position of shadow]
*/
                      ),
                      child: SpecialistCard(bottomSheet: true,onTap: (){}, phs: phs[0], verified: verified, child: Container(),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceButton(width: 140.w,height: 45.w,
                              text:'Cancel',tColor: myBlueColor,color: kColorsLightBlue100,onTap: (){
                            Navigator.pop(context);
                          }),
                          ChoiceButton(width: 140.w,height: 45.w,
                              text:'Yes, Remove',color: myBlueColor,tColor: Colors.white,onTap: (){
                            Navigator.pop(context);
                          }),
                        ],),
                    )
                  ]),
            )
        ));
  }
}
