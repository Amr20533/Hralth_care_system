import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTap,required this.text,required this.loading,this.width = double.infinity,this.fontSize = 12,this.boxShadow = false,this.height = 56,this.color = myBlueColor,Key? key}) : super(key: key);
  final void Function()? onTap;
  final String text;
  final bool loading;
  final double width;
  final double fontSize;
  final double height;
  final Color color;
  final bool boxShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: boxShadow ? customBoxShadow(3,myGreyColor,4) : null
      ),
      child: MaterialButton(
        onPressed: loading ? null : onTap,
        child: loading ? const Center(child: CircularProgressIndicator(color: Colors.white,),) : Text(text,style: TextStyle(color: Colors.white,fontSize: fontSize),),
      ),
    );
  }
}
