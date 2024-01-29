import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/favs/widgets/hospital_card.dart';
import 'package:co_rhema/User/views/home/widgets/hospital_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavHospitalScreen extends StatelessWidget {
  const FavHospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),shrinkWrap: true,
      itemBuilder: (context,index) => HospitalCard(onTap:(){
        _showBottomSheet(context);
      },image:'assets/images/clinc01.jpg',ratings:'4.8',title: 'Serenity Wellness Clinic', time:'15 min', location:'8502 Perston Rd, Inglewood, Maine 98380',distance: '1.5km',),
      separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
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
                    Container(height: 1.0.w,margin: EdgeInsets.symmetric(horizontal: 20.0.w),
                      decoration:const BoxDecoration(
                        color: kColorsLightGrey,
                      ),),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(12.0.w,20.0.w,12.0.w,28.0.w,),
                    //   decoration: BoxDecoration(
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black38.withOpacity(0.1), //color of shadow
                    //         blurRadius: 7.0, //spread radius
                    //         offset:const Offset(-2, -2),),
                    //       BoxShadow(
                    //         color: Colors.black38.withOpacity(0.1), //color of shadow
                    //         blurRadius: 7.0, //spread radius
                    //         offset:const Offset(2, 2),),
                    //     ], // changes position of shadow]
                    //   ),
                    //   child: SpecialistCard(bottomSheet: true,onTap: (){}, phs: phs[0], verified: verified),
                    // ),
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
