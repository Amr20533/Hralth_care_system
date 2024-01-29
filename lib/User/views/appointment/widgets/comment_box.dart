import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CommentBox extends StatelessWidget {
  const CommentBox({required this.width, required this.height, required this.hintText,required this.borderRadius,super.key});
  final double width,height;
  final String hintText;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,height: height,
      padding: EdgeInsets.only(left: 12.0.w),
      margin: EdgeInsets.only(left: 8.0.w),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: borderRadius,

      ),
      child: TextFormField(
        maxLines: null, // Set maxLines to null for a multiline text input
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400,color: Colors.black45,fontSize: 10.w),
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}