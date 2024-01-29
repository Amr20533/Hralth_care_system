import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:co_rhema/User/views/chats/widgets/chat_record.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
class ChatsDetailsScreen extends StatelessWidget {
  const ChatsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: myBlueColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              color: myBlueColor,
              padding: EdgeInsets.fromLTRB( 12.0.w,10.0.w,12.0.w,38.0.w,),
              child: Row(
                children: [
                  IconCircle(onTap:(){
                    // Navigator.of(context).pop(true);
                    Get.back();
                    },icon: AntDesign.arrowleft,),
                  const Spacer(flex: 1,),
                  ///************* user information ***************
                  Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 17.w,
                        backgroundImage: NetworkImage('https://media.istockphoto.com/id/1399387349/photo/confident-young-mixed-race-female-doctor-standing-with-her-arms-crossed-inside-a-medical.webp?s=2048x2048&w=is&k=20&c=7qmfObV2rdtiLmbmb6k6aNQ9861zBrfj7LGxhRykO0o='),
                      ),
                      SizedBox(width: 8.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Dr. Angie Brekke",style: TextStyle( fontSize: 13.w ,fontWeight: FontWeight.w400,color: Colors.white),),
                          SizedBox(height: 2.w,),
                          Text("122".tr,style: TextStyle(color: Colors.white70, fontSize: 10.w),),
                        ],
                      ),

                    ],
                  ),
                  /*Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22.w,
                        child: CachedNetworkImage(
                          imageUrl: 'https://th.bing.com/th/id/OIP.M2MOsgIVeJZrfUSIjRrtcQAAAA?w=375&h=547&rs=1&pid=ImgDetMain',
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Dr. Angle Brekke", style:  TextStyle(fontSize: 10.w,fontWeight: FontWeight.w400),),
                          SizedBox(height: 4.w,),
                          Text('online',style: TextStyle(fontSize: 10.w,color: Colors.white38, fontWeight: FontWeight.normal),),
                        ],
                      )
                    ],
                  ),*/
                  const Spacer(flex: 6,),

                  // IconCircle(onTap:(){},icon: FontAwesome.ellipsis_v,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(width: 33.w,height: 33.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26.0),
                        border:Border.all(color: Colors.grey[300]!,width: 1),
                      ),
                      child: Center(child: Icon(FontAwesome.ellipsis_v,size: 15.w,color: Colors.black,)),
                    ),
                  )
                  // Container(width: 33.w,height: 33.w,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(26.0),
                  //     border:Border.all(color: Colors.grey[300]!,width: 1),
                  //   ),
                  //   child: Center(child: SvgPicture.asset('assets/images/icons/heart-icon.svg',color: Colors.black54,width: 16.w,height: 16.w,)),
                  // ),
                ],),
            ),

            Container(
              width: 325.w,height: 735.h,
              margin: EdgeInsets.only(top: 825.h * 0.11),
              decoration: BoxDecoration(
                // color:const Color(0xFFE5E5E5),
                  color:const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(28.w),topRight: Radius.circular(28.w),)
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 18.0.h,),
                      child: Text('121'.tr,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 11.w),),
                    ),
                  ),
                  Positioned(
                    top: 36.0.w,left: 12.0.w,
                    child: Container(
                      // height: 52.h,
                      padding: EdgeInsets.only(left: 5.0.w,),
                      // margin: EdgeInsets.only(top: 12.0.w),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ChatRecord(
                            sender: 'Angile Brekke',
                            message: 'Hello, how are you?',
                            timestamp: '10:30 AM',
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              // width: 160.w,
                              margin: EdgeInsets.only(top: 8.0.h,bottom: 8.0.h,left: 40.w,right: 16.0.w),
                              constraints: BoxConstraints(
                                  maxWidth: 255.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin: EdgeInsets.only(left:8.w),
                                    decoration: BoxDecoration(
                                      color: myBlueColor,
                                      // border: Border.all(color: Colors.grey[300]!,width: 1.0),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0.w),topRight: Radius.circular(5.0.w),bottomLeft: Radius.circular(5.0.w),),
                                    ),
                                    child: Text('100'.tr.substring(0,112),style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(0.9)),),
                                  ),
                                  // SizedBox(height: 4.0.h),

                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0.w,top: 8.0.h),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 3.0.w),
                                        Text(
                                          "10:30 AM",
                                          style: TextStyle(color: Colors.grey,fontSize: 11.w),
                                        ),
                                        const Spacer(flex: 12,),
                                        CircleAvatar(radius: 9.w,
                                          // You can use a profile image here
                                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
                                          // child: Text(sender[0]),
                                        ),
                                        const Spacer(flex: 1,),
                                        // SizedBox(width: 6.0.w),
                                        Text(
                                          "Esther Howard",
                                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.w),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // SizedBox(width: 4.0.w),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // width: 160.w,
                            margin: EdgeInsets.symmetric(vertical: 16.0.h),
                            constraints: BoxConstraints(
                                maxWidth: 240.w
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  constraints: BoxConstraints(
                                      maxHeight: 200.h
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  margin: EdgeInsets.only(left:8.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFDFDFD),
                                    border: Border.all(color: Colors.grey[300]!,width: 1.0),
                                    // image: DecorationImage(
                                    //   image: NetworkImage('https://unsplash.com/photos/blue-and-white-plastic-bottle-mAGZNECMcUg')
                                    // ),
                                    image: DecorationImage(fit: BoxFit.cover,
                                      image: NetworkImage('https://media.istockphoto.com/id/1399387349/photo/confident-young-mixed-race-female-doctor-standing-with-her-arms-crossed-inside-a-medical.webp?s=2048x2048&w=is&k=20&c=7qmfObV2rdtiLmbmb6k6aNQ9861zBrfj7LGxhRykO0o=')
                                    ),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0.w),topRight: Radius.circular(6.0.w),bottomRight: Radius.circular(6.0.w),),
                                  ),
                                  // child: Text('100'.tr.substring(0,112),style: Theme.of(context).textTheme.titleSmall,),
                                ),
                                // SizedBox(height: 4.0.h),

                                Padding(
                                  padding: EdgeInsets.only(left: 4.0.w,top: 12.0.h),
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
                                        'Angile Brekke',
                                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.w),
                                      ),
                                      const Spacer(flex: 12,),
                                      // SizedBox(width: 25.0.w),
                                      Text(
                                        '10:46 AM',
                                        style: TextStyle(color: Colors.grey,fontSize: 11.w),
                                      ),
                                    ],
                                  ),
                                ),

                                // SizedBox(width: 4.0.w),
                              ],
                            ),
                          ),
                          const ChatRecord(
                            sender: 'Angile Brekke',
                            message: 'Hello, how are you?',
                            timestamp: '10:46 AM',
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              // width: 160.w,
                              margin: EdgeInsets.only(top: 8.0.h,bottom: 8.0.h,left: 40.w,right: 16.0.w),
                              constraints: BoxConstraints(
                                  maxWidth: 255.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin: EdgeInsets.only(left:8.w),
                                    decoration: BoxDecoration(
                                      color: myBlueColor,
                                      // border: Border.all(color: Colors.grey[300]!,width: 1.0),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0.w),topRight: Radius.circular(5.0.w),bottomLeft: Radius.circular(5.0.w),),
                                    ),
                                    child: Text('100'.tr.substring(0,112),style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white.withOpacity(0.9)),),
                                  ),
                                  // SizedBox(height: 4.0.h),

                                  Padding(
                                    padding: EdgeInsets.only(left: 4.0.w,top: 8.0.h),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 3.0.w),
                                        Text(
                                          "11:06 AM",
                                          style: TextStyle(color: Colors.grey,fontSize: 11.w),
                                        ),
                                        const Spacer(flex: 12,),
                                        CircleAvatar(radius: 9.w,
                                          // You can use a profile image here
                                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'),
                                          // child: Text(sender[0]),
                                        ),
                                        const Spacer(flex: 1,),
                                        // SizedBox(width: 6.0.w),
                                        Text(
                                          "Esther Howard",
                                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.w),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // SizedBox(width: 4.0.w),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],),
        ),
      ),
      bottomNavigationBar:  Container(
        constraints: BoxConstraints(
            maxHeight: 75.h
        ),
        decoration: BoxDecoration(
          color: const Color(0XFFF5F5F5),
          borderRadius: BorderRadius.circular(5.0.w),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 5.h),
        margin: EdgeInsets.only(left: 10.0.w,right: 10.0.w,bottom: 15.h),
        child: Row(
          children: [
            Container(width: 32.w,height: 32.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0.w),
                ),
                child: Icon(MaterialIcons.add,size: 18.w,color: const Color(0XFF0567FC),)), // Second icon
            SizedBox(width: 10.0.w), // Spacer between icon and TextField
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message here...',
                  border: InputBorder.none,
                ),
              ),
            ), // TextField
            SizedBox(width: 10.0.w), // Spacer between TextField and second icon
            Container(width: 32.w,height: 32.w,
                decoration: BoxDecoration(
                  color: myBlueColor,
                  borderRadius: BorderRadius.circular(5.0.w),
                ),
                child: Icon(MaterialIcons.mic,size: 18.w,color: Colors.white,)), // Second icon
          ],
        ),
      ),
    );
  }
}
//https://www.youtube.com/watch?si=JFWCpOFWMi1W7Z7u&embeds_referring_euri=https%3A%2F%2Fwww.bing.com%2F&embeds_referring_origin=https%3A%2F%2Fwww.bing.com&source_ve_path=Mjg2NjQsMTY0NTA2&feature=emb_share&v=HnHicg5zdEY