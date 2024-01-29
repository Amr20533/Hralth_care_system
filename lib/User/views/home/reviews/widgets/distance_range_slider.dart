import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/views/home/reviews/widgets/custom_slider_thumb_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistanceRangeSlider extends StatefulWidget {
  const DistanceRangeSlider({super.key});

  @override
  _DistanceRangeSliderState createState() => _DistanceRangeSliderState();
}

class _DistanceRangeSliderState extends State<DistanceRangeSlider> {
  double _startValue = 20.0;
  double _endValue = 80.0;
  RangeValues valuesBottom = RangeValues(0, 2);
  RangeValues values = RangeValues(7, 100);
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: myBlueColor,
        inactiveTickMarkColor: Colors.transparent,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
        thumbColor: Colors.white,
        thumbShape: CustomSliderThumbShape(),
        activeTickMarkColor: Colors.transparent,
        inactiveTrackColor: Colors.black26,

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
          ),
        ],
      ),
    );
  }
  Widget buildSlideLabel(double value)=> Container(
    width: 25.w,
    child: Text(value.round().toString(),style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
  );

  Widget buildSlideBottomLabel(double value) {
    final labels = ['2','7','22','50','100','150+'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions  = (max - min).toInt();



    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      RangeSlider(
      min: min,
      max: max,
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
    ),
        Container(
          width: 25.w,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
                (index, label){
                final selectedColor = Colors.black;
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

class Utils{
  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder )=> models.asMap().map<int, Widget>((index, model) => MapEntry(index, builder(index, model))).values.toList();
}