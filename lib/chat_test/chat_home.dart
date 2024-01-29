import 'package:co_rhema/chat_test/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatHome extends StatelessWidget {
  ChatHome({Key? key}) : super(key: key);
  List<User> users = User.users;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin:Alignment.topLeft ,end:Alignment.topRight ,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Chats',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark
              );
            },
                icon: Icon(
                  Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 825.h *   0.125,
              margin: EdgeInsets.only(left:5.0.w,top:10.w,right:5.0.w),
              child: ListView.builder(
                itemCount: users.length,scrollDirection: Axis.horizontal,shrinkWrap: true,
                  itemBuilder: (context,index){
                  User user = users[index];
                return Container(
                  margin: EdgeInsets.only(right: 5.0.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius:35,backgroundImage: NetworkImage(user.imageUrl),
                      ),
                      SizedBox(height: 7.0.h,),
                      Text(user.name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
              }),
    ),
    ],
    )),
    );
  }
}
// mixin CustomAppBarMixin on StatelessWidget {
//   Size get preferredSize => const Size.fromHeight(56.0);
//
//   Widget buildAppBar(BuildContext context);
// }
//
// Widget buildAppBar(BuildContext context){
//   return AppBar(
//     centerTitle: true,
//     elevation: 0,
//     title: Text('Chats',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
//     actions: [
//       IconButton(onPressed: (){
//         Get.changeThemeMode(
//             Get.isDarkMode ? ThemeMode.light : ThemeMode.dark
//         );
//       },
//           icon: Icon(
//             Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
//           ))
//     ],
//   );
// }
// class CustomAppBar extends StatelessWidget with CustomAppBarMixin {
//   const CustomAppBar({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return buildAppBar(context);
//
//   }
//   //
//   // @override
//   // Size get preferredSize => const Size.fromHeight(56.0);
//
// }
