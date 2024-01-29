import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/chat/chat_controller.dart';
import 'package:co_rhema/User/modules/users.dart';
import 'package:co_rhema/User/views/appointment/widgets/custom_doc_card.dart';
import 'package:co_rhema/User/views/chats/chats_details_screen.dart';
import 'package:co_rhema/User/views/chats/widgets/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatControllerImp controller = Get.put(ChatControllerImp());

  List<String> docs = [
    'https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.webp?b=1&s=170667a&w=0&k=20&c=8CebFLF4PFnt9JYJznGhYoOQxcyHLVpTGVfkvEsZd2Q=',
    'https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.webp?b=1&s=170667a&w=0&k=20&c=8CebFLF4PFnt9JYJznGhYoOQxcyHLVpTGVfkvEsZd2Q=',
    'https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.webp?b=1&s=170667a&w=0&k=20&c=8CebFLF4PFnt9JYJznGhYoOQxcyHLVpTGVfkvEsZd2Q=',
    'https://media.istockphoto.com/id/1530248128/photo/portrait-of-cheerful-female-doctor-with-digital-tablet-beside-window-in-corridor.webp?b=1&s=170667a&w=0&k=20&c=lr9kQSJFSMXao-_XHEyTjca6fhzdoIg9lDdOL8j-kHE=',
    'https://media.istockphoto.com/id/1421939647/photo/female-doctor-smiles-for-hospital-publicity-photo.webp?b=1&s=170667a&w=0&k=20&c=gX-Bt8sNJw-72DIQOZkt1wjPVejda7vsjtbcUovDQfU=',
    'https://media.istockphoto.com/id/1366016941/photo/shot-of-a-young-female-doctor-using-a-digital-tablet-at-work.webp?b=1&s=170667a&w=0&k=20&c=Ck1KOSJoHg58BfhDu1qtEVl3xb1DlZdaT0wOjWhrBLk=',
    'https://media.istockphoto.com/id/1325234322/photo/shot-of-a-young-female-doctor-taking-a-break-from-her-work.jpg?s=612x612&w=0&k=20&c=_WEv8wazsbAsCNkGGK4pW5anF816qVywkWXWS4aqXHM=',
    'https://media.istockphoto.com/id/1325234322/photo/shot-of-a-young-female-doctor-taking-a-break-from-her-work.jpg?s=612x612&w=0&k=20&c=_WEv8wazsbAsCNkGGK4pW5anF816qVywkWXWS4aqXHM=',
  ];
  List<String> docsChats = [
    'https://media.istockphoto.com/id/1399387349/photo/confident-young-mixed-race-female-doctor-standing-with-her-arms-crossed-inside-a-medical.webp?s=2048x2048&w=is&k=20&c=7qmfObV2rdtiLmbmb6k6aNQ9861zBrfj7LGxhRykO0o=',
    'https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.webp?b=1&s=170667a&w=0&k=20&c=8CebFLF4PFnt9JYJznGhYoOQxcyHLVpTGVfkvEsZd2Q=',
    'https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.webp?b=1&s=170667a&w=0&k=20&c=8CebFLF4PFnt9JYJznGhYoOQxcyHLVpTGVfkvEsZd2Q=',
    'https://media.istockphoto.com/id/1530248128/photo/portrait-of-cheerful-female-doctor-with-digital-tablet-beside-window-in-corridor.webp?b=1&s=170667a&w=0&k=20&c=lr9kQSJFSMXao-_XHEyTjca6fhzdoIg9lDdOL8j-kHE=',
    'https://media.istockphoto.com/id/1421939647/photo/female-doctor-smiles-for-hospital-publicity-photo.webp?b=1&s=170667a&w=0&k=20&c=gX-Bt8sNJw-72DIQOZkt1wjPVejda7vsjtbcUovDQfU=',
    'https://media.istockphoto.com/id/1366016941/photo/shot-of-a-young-female-doctor-using-a-digital-tablet-at-work.webp?b=1&s=170667a&w=0&k=20&c=Ck1KOSJoHg58BfhDu1qtEVl3xb1DlZdaT0wOjWhrBLk=',
    'https://media.istockphoto.com/id/1325234322/photo/shot-of-a-young-female-doctor-taking-a-break-from-her-work.jpg?s=612x612&w=0&k=20&c=_WEv8wazsbAsCNkGGK4pW5anF816qVywkWXWS4aqXHM=',
    'https://media.istockphoto.com/id/1325234322/photo/shot-of-a-young-female-doctor-taking-a-break-from-her-work.jpg?s=612x612&w=0&k=20&c=_WEv8wazsbAsCNkGGK4pW5anF816qVywkWXWS4aqXHM=',
  ];
  ChatScreen({Key? key}) : super(key: key);
  List<ChatUsers> chatUsers = ChatUsers.chats;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             height: 220.h,
             color: myBlueColor,
             padding: EdgeInsets.only(top: 8.0.w,left: 12.0.w),
             child: Column(
               children: [
                 const CustomDocCard(title:"Chat",deActivate: true, icon: AntDesign.arrowleft,color: myBlueColor,txtColor: Colors.white,),
                 Padding(
                   padding: EdgeInsets.only(top: 18.0.w,bottom: 5.0.w,left: 12.0.w,right: 18.w),
                   child: TextField(
                     decoration: InputDecoration(
                       hintText: "Search Doctor",
                       hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14.w),
                       prefixIcon: Icon(AntDesign.search1,color: Colors.blue[500],),
                       filled: true,
                       fillColor: const Color(0XFFFFFFFF),
                       contentPadding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 10.w),
                       // contentPadding: EdgeInsets.only(bottom: 5.w,top: 8.w),
                       enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(7.w),
                           borderSide: BorderSide(
                               color: Colors.grey.shade100
                             // color: Color(0XFFFFFFFF),
                           )
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),

        Container(
          width: 325.w,
          margin: EdgeInsets.only(top: 825.h * 0.18),
          decoration: BoxDecoration(
            color:const Color(0xFFFCFCFC),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32.w),topRight: Radius.circular(32.w),)
          ),
          child: Stack(
            children: [

              Container(
                height: 50.h,
                padding: EdgeInsets.only(left: 5.0.w,),
                margin: EdgeInsets.only(left: 10.w,top: 18.0.w,),
                // margin: EdgeInsets.only(top: 12.0.w),
                child: ListView.separated(
                  itemCount: docs.length,
                  shrinkWrap: true,scrollDirection: Axis.horizontal,
                  // padding: EdgeInsets.only(right: 12.w),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return CircleAvatar(
                      radius: 22.w,
                      backgroundImage: NetworkImage(docs[index]),
                    );
                  },
                  separatorBuilder: (context, _) => SizedBox(width: 12.0.w,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:60.0.w),
                child: ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16.w),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return ChatCard(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatsDetailsScreen()));

                        // controller.goToChats();
                      },
                      name: chatUsers[index].text!,
                      messageText: chatUsers[index].messageText!,
                      imageUrl: docsChats[index],
                      time: chatUsers[index].time!,
                      isMessageRead: (index == 0 || index == 3)?true:false,
                    );
                  },
                ),
              ),
            ],
          ),
        )
        ],
      ),
    );
/*

*/
  }
}
