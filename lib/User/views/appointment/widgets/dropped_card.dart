import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DroppedCard extends StatelessWidget {
  const DroppedCard({
    required this.text,required this.items,required this.onChanged,
    super.key,
  });
  final void Function(String? value)? onChanged;
  final String text;
  final List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,height: 40.0.w,alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      // margin: EdgeInsets.only(left: 5.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0.w),
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,style: TextStyle(color: const Color(0XFF797979),fontSize: 12.w,fontWeight: FontWeight.w500),),
          DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down,color: myBlueColor.withOpacity(0.7),size: 26.w,),
            iconSize: 32,elevation: 4,
            style: TextStyle(fontSize: 13.w,fontWeight: FontWeight.w400,color: const Color(0XFF797979)),
            items: items,
            underline: Container(height: 0,),
            onChanged: onChanged,

          )
        ],
      ),
    );
  }
}
