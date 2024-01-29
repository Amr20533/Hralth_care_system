import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatRecord extends StatelessWidget {
  final String sender;
  final String message;
  final String timestamp;

  const ChatRecord({super.key, required this.sender, required this.message, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 160.w,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      constraints: BoxConstraints(
        maxWidth: 240.w
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(left:8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFDFDFD),
              border: Border.all(color: Colors.grey[300]!,width: 1.0),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0.w),topRight: Radius.circular(6.0.w),bottomRight: Radius.circular(6.0.w),),
            ),
            child: Text('100'.tr.substring(0,112),style: Theme.of(context).textTheme.titleSmall,),
          ),
          // SizedBox(height: 4.0.h),

          Padding(
            padding: EdgeInsets.only(left: 4.0.w,top: 8.0.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(radius: 9.w,
                  // You can use a profile image here
                  backgroundImage: NetworkImage('https://media.istockphoto.com/id/1399387349/photo/confident-young-mixed-race-female-doctor-standing-with-her-arms-crossed-inside-a-medical.webp?s=2048x2048&w=is&k=20&c=7qmfObV2rdtiLmbmb6k6aNQ9861zBrfj7LGxhRykO0o='),
                  // child: Text(sender[0]),
                ),
                const Spacer(flex: 1,),
                // SizedBox(width: 6.0.w),
                Text(
                  sender,
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.w),
                ),
                const Spacer(flex: 12,),
                // SizedBox(width: 25.0.w),
                Text(
                  timestamp,
                  style: TextStyle(color: Colors.grey,fontSize: 11.w),
                ),
              ],
            ),
          ),

          // SizedBox(width: 4.0.w),
        ],
      ),
    );
  }
}
