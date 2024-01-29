import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/home/filter_controller.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/appointment/widgets/dot_color.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/home/reviews/widgets/custom_slider_thumb_shape.dart';
import 'package:co_rhema/User/views/home/reviews/widgets/distance_range_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // double _value = 20;
  // SfRangeValues _value =  SfRangeValues(20.0, 50.0);
  // SfRangeValues _dateValue = SfRangeValues(DateTime(2022, 01, 01), DateTime(2023,12,01));
  // double _value = 0.5;
  double _startValue = 7;
  double _endValue = 100;
  RangeValues valuesBottom = RangeValues(0, 2);
  RangeValues values = RangeValues(7, 100);
  String _status = 'idle';
  Color _statusColor = Colors.amber;
  final List<String> list = ['2','7','22','50','100','150+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body:GetBuilder<FilterControllerImp>(builder: (controller){
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:14.0.h),
                  child: CustomDocCard(title:"57".tr, icon: AntDesign.arrowleft,),
                ),
                Padding(
                  padding: EdgeInsets.only(top:24.0.h,bottom: 10.0.h,left: 10.0.w),
                  child: Text('58'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 58.h,
                  child: ListView.builder(
                    itemCount: controller.filterList.length,scrollDirection: Axis.horizontal,padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),shrinkWrap: true,
                    itemBuilder: (context,index) => GestureDetector(
                      onTap: (){
                        controller.selectCategory(index);
                      },
                      child: Container(
                          padding: EdgeInsets.only(left:14.h,right:14.h,top: 8.0.h,bottom: 5.0.h,),
                          margin: EdgeInsets.only(top:8.h,bottom:12.h,left: 12.w),
                          decoration: BoxDecoration(
                            color: controller.selected == index ? myBlueColor : const Color(0XFFF2F2F2),
                            borderRadius: BorderRadius.circular(16.w),
                            border:Border.all(color:const Color(0XFF838383).withOpacity(0.1),width: 1),
                          ),
                          child:Text(controller.filterList[index],style: Theme.of(context).textTheme.titleSmall!.copyWith(color: controller.selected == index ? Colors.white : const Color(0XFF797979),fontSize: 16.h,fontWeight: FontWeight.w500),)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:16.0.h,bottom: 12.0.h,left: 10.0.w),
                  child: Text('59'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),),
                ),
                ListView.builder(
                  itemCount: controller.reviews.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                  itemBuilder: (context,index) => GestureDetector(
                    onTap: (){
                      controller.selectReview(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 8.0.w,right: 10.0.w),
                      margin: EdgeInsets.only(bottom: 8.0.h),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...List.generate(5, (index) => Container(
                              margin: EdgeInsets.only(right: 5.0.w),
                              child: Icon(AntDesign.star,color: kColorsLightYellow,size: 16.w,))),
                          const Spacer(flex: 1,),
                          Text(controller.reviews[index],style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14.w,color: Colors.black,fontWeight: FontWeight.w500),),
                          const Spacer(flex: 7,),
                          DotColor(width:18.w,height: 18.w,
                            color: myBlueColor,isSelected: index == controller.selectedReview ? true : false,),
                        ],
                      ),
                    ),
                  ), ),
                Padding(
                  padding: EdgeInsets.only(top:16.0.h,bottom: 12.0.h,left: 10.0.w),
                  child: Text('60'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),),
                ),
                /// ********************* Slider
/*
                SfRangeSlider(
                  values: SfRangeValues(_startValue, _startValue),
                  min: 0.0,
                  max: 100.0,
                  dateIntervalType: DateIntervalType.years,
                  dateFormat: DateFormat.y(),
                  enableTooltip: true,

                  // showTicks: true,
                  interval: 20,
                  // numberFormat: NumberFormat('\$'),
                  onChanged: (newValues) {
                    setState(() {
                      _startValue = newValues.start;
                      _endValue = newValues.end;
                    });
                  },

                ),
*/

                 // const DistanceRangeSlider(),
                buildSlideBottomLabel(),
                Container(height: 20.0.h,padding: EdgeInsets.only(left: 14.w),
                child: Row(
                  children: [
                    ...List.generate(list.length, (index) => Padding(
                      padding: EdgeInsets.only(right:list[index] != '150+' ? 38.w : 10.w),
                      child: Text(list[index],
                        style: TextStyle(fontSize: 12.w,fontWeight: FontWeight.w500).copyWith(color: ( list[index] == '7' || list[index] == '100')? Colors.black : Colors.black12,),
                    )),),
                  ],
                ),
                ),
                // buildSlideBottomLabel(),

                 // SliderTheme(
                 //      data: SliderThemeData(
                 //        thumbColor: Colors.white,
                 //        thumbShape: CustomSliderThumbShape(),
                 //        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                 //      ),
                 //      child: Slider(
                 //        value: _value,
                 //        onChanged: (newValue) {
                 //          setState(() {
                 //            _value = newValue;
                 //          });
                 //          print('${325.w }');
                 //          print('${825.h }');
                 //        },
                 //      ),
                 //    ),
/*
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: myBlueColor,
                    inactiveTickMarkColor: Colors.black12,

                    ///change thumb size
                    // rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),


                    thumbColor:Colors.white ,
                    // thumbShape: SliderComponentShape.noOverlay,
                    thumbShape: CustomSliderThumbShape(),

                    /// ticks in between
                    activeTickMarkColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RangeSlider(
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        labels: RangeLabels(
                          _startValue.round().toString(),
                          _endValue.round().toString(),
                        ),
                        values: RangeValues(_startValue, _endValue),
                        onChanged: (values) {
                          setState(() {
                            _startValue = values.start;
                            _endValue = values.end;
                          });
                        },
                      )
                      // Slider(
                      //   min: 7.0,
                      //   max: 150.0,
                      //   value: _value,
                      //   divisions: 32,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       _value = value;
                      //       _status = 'active (${_value.round()})';
                      //       _statusColor = Colors.green;
                      //     });
                      //   },
                      //   onChangeStart: (value) {
                      //     setState(() {
                      //       _status = 'start';
                      //       _statusColor = Colors.lightGreen;
                      //     });
                      //   },
                      //   onChangeEnd: (value) {
                      //     setState(() {
                      //       _status = 'end';
                      //       _statusColor = Colors.red;
                      //     });
                      //   },
                      // ),
                      // Text(
                      //   'Status: $_status',
                      //   style: TextStyle(color: _statusColor),
                      // ),
                    ],
                  ),
                ),
*/
                /// ********************* Slider

                Padding(
                  padding: EdgeInsets.only(right: 12.0.w,left: 12.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('61'.tr,style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),),
                          SizedBox(height: 6.h,),
                          Text('62'.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),),
                        ],
                      ),
                      CupertinoSwitch(
                        value: controller.active,activeColor: myBlueColor,
                        onChanged: (value) {
                          controller.toggleIcon(value);
                        },

                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },),
      bottomNavigationBar: Container(width: double.infinity,
        height: 75.w,padding: EdgeInsets.fromLTRB(12.0.w,12.0.w,12.0.w,22.0.w),
        decoration: BoxDecoration(color: Colors.white,
            boxShadow: [BoxShadow(
              blurRadius: 22,offset:const Offset(-7,-7),
              color:const Color(0XFF797979).withOpacity(0.1),
            )],
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.w),topLeft: Radius.circular(14.w))),
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceButton(width: 130.w,height: 45.w,
                  text:'55'.tr,tColor: myBlueColor,color: kColorsLightBlue100,onTap: (){
                Get.back();
              }),
              ChoiceButton(width: 130.w,height: 45.w,
                  text:'56'.tr,color: myBlueColor,tColor: Colors.white,onTap: (){

              }),
            ],),
        ) ,),
    );
  }
  Widget buildSlideBottomLabel() {
    final labels = ['2','7','22','50','100','150+'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions  = (max - min).toInt();
    const inactiveColor  =  Color.fromRGBO(109, 114, 120, 0.7);
    const activeColor  =  myBlueColor;



    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5,
              thumbColor: myBlueColor,
              inactiveTrackColor: inactiveColor,
              inactiveTickMarkColor: inactiveColor,
              activeTickMarkColor: activeColor,
              activeTrackColor: activeColor,
            ),
            child: RangeSlider(
              min: min,
              max: max,
              divisions: divisions,

              labels: RangeLabels(
                _startValue.round().toString(),
                _endValue.round().toString(),
              ),
              values: RangeValues(_startValue, _endValue),
              onChanged: (values) {
                setState(() {
                  _startValue = values.start;
                  _endValue = values.end;
                });

              },
            ),
          ),
          Container(
            width: 25.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                  labels,
                      (index, label){
                    const selectedColor = Colors.black;
                    final unSelectedColor = Colors.black.withOpacity(0.3);
                    final isSelected = index >= valuesBottom.start && index <= valuesBottom.end;
                    final color = isSelected ? selectedColor : unSelectedColor;
                    return buildLabel(label: label, color: color );
                  }
              ),
            ),
          )

        ]);
  }
  Widget buildLabel({required String label, required Color color }) => Text(
    label,textAlign: TextAlign.center,
    style: TextStyle(fontSize: 8.w,fontWeight: FontWeight.bold).copyWith(color: color),
  );

}
/*
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Slider(
                      min: 7.0,
                      max: 150.0,
                      value: _value,
                      divisions: 32,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _status = 'active (${_value.round()})';
                          _statusColor = Colors.green;
                        });
                      },
                      onChangeStart: (value) {
                        setState(() {
                          _status = 'start';
                          _statusColor = Colors.lightGreen;
                        });
                      },
                      onChangeEnd: (value) {
                        setState(() {
                          _status = 'end';
                          _statusColor = Colors.red;
                        });
                      },
                    ),
                    Text(
                      'Status: $_status',
                      style: TextStyle(color: _statusColor),
                    ),
                  ],
                ),

 */
/**
  // DateFormat -------------- Slider ---------------------
  SfRangeValues _dateValue = SfRangeValues(DateTime(2022, 01, 01), DateTime(2023,12,01));

 SfRangeSlider(
                  values: _dateValue,
                  min: 0.0,
                  max: 100.0,
                  dateIntervalType: DateIntervalType.years,
                  dateFormat: DateFormat.y(),
                  enableTooltip: true,
                  showTicks: true,
                  interval: 20,
                  // numberFormat: NumberFormat('\$'),
                  onChanged: (dynamic newValues) {
                    setState(() {
                      _value = newValues;
                    });
                  },

                ),
 */