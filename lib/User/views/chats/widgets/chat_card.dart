import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key,required this.messageText,required this.imageUrl,this.isMessageRead = false, required this.onTap, required this.time,required this.name}) : super(key: key);
  final void Function()? onTap;
  final bool isMessageRead;
  final String messageText,name,time,imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 80.h),
        padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 8.w,bottom: 8.w),
        margin:EdgeInsets.only(left: 12.0.w,right: 16.0.w,bottom: 10.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0.w),
          border: Border.all(width: 1.0, color: Colors.grey[300]!,
          )
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        maxRadius: 18.w,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      // CircleAvatar(
                      //   maxRadius: 18.w,
                      //   // backgroundColor: Colors.white,
                      //   child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,)
                      // ),
                      Positioned(bottom: 0,right: -5.0,
                        child: Container(
                          margin: EdgeInsets.only(top:12.w/4,right:12.w/3),
                          padding: EdgeInsets.all(1.w),
                          width: 12.w,height: 12.w,
                          decoration:  BoxDecoration(
                              border: Border.all(color:const Color(0XFF838383).withOpacity(0.4)),
                              shape: BoxShape.circle),
                          child:const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.green,shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(width: 12.w,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style:  TextStyle(fontSize: 14.w,fontWeight: FontWeight.w500),),
                          SizedBox(height: 4.w,),
                          Text(messageText,style: TextStyle(fontSize: 12.w,color: Colors.grey.shade500, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(time,style: TextStyle(fontSize: 12.w,fontWeight: isMessageRead?FontWeight.w500:FontWeight.normal,color: isMessageRead ? kColorsLightGrey.withOpacity(0.6) : Colors.black),),
          ],
        ),
      ),
    );
  }
}
