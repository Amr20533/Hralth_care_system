import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?) inputValidator;
  final void Function()? suffixTap;
  final bool isPassword,isPhone;
  final TextInputType type;
  final String? suffixText;
  const CustomTextFormAuth(
      {Key? key,
        required this.hintText,
        required this.labelText,
        required this.iconData,
        this.suffixIcon,
        this.suffixText,
        this.isPhone = false,
        this.suffixTap,
        this.controller,
        this.isPassword = false,
        required this.type,
        // this.isText = false,
        required this.inputValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 11.w,color: Colors.grey[800]),),
          SizedBox(height: 8.0.h,),
          TextFormField(
            // keyboardType: !isText ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
            obscureText: isPassword,
            keyboardType:type,
            validator: inputValidator,
            controller: controller,
            style: TextStyle(fontSize: 12.0.w), // Set the font size here
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 12.w),
                // prefixIcon: Icon(AntDesign.search1,color: Colors.blue[500],),

                filled: true,
                fillColor: Colors.grey.shade50,
                contentPadding:  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.w),
                // contentPadding: EdgeInsets.only(bottom: 5.w,top: 8.w),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.w),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300,
                    ),
                ),
                // prefixIcon: Icon(iconData),
                suffixIcon: !isPhone ? Padding(
                  padding:  EdgeInsets.only(right: 4.0.w),
                  child: IconButton(onPressed:suffixTap, icon:Icon(suffixIcon,size: 12.w,)),
                ) : Padding(
                  padding: EdgeInsets.only(right:8.0.w),
                  child: GestureDetector(onTap:suffixTap, child:Text(suffixText!,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: myBlueColor.withOpacity(0.6),fontWeight: FontWeight.w500,height: 2.0.h),)),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.w)),
          ),
            onChanged: inputValidator,

          ),
        ],
      ),
    );
  }
}
/*

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String Function(String?)? inputValidator;
  final void Function()? suffixTap;
  final bool isPassword;
  final TextInputType type;
  const CustomTextFormAuth(
      {Key? key,
        required this.hintText,
        required this.labelText,
        required this.iconData,
        this.suffixIcon,
        this.suffixTap,
        this.controller,
        this.isPassword = false,
        required this.type,
        // this.isText = false,
        required this.inputValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        // keyboardType: !isText ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        obscureText: isPassword,
        keyboardType:type,
        validator: inputValidator,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labelText)),
            prefixIcon: Icon(iconData),
            suffixIcon:  IconButton(onPressed:suffixTap, icon:Icon(suffixIcon)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}*/
