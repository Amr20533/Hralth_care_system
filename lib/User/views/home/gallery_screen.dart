import 'package:cached_network_image/cached_network_image.dart';
import 'package:co_rhema/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
 /* final List<String> images = [
    'https://images.unsplash.com/photo-1580281657702-257584239a55?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGhvc3BpdGFsc3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1587351021759-3e566b6af7cc?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://th.bing.com/th/id/OIP.LnyOcIg-wgb6eM5G2UTVwAHaEK?w=308&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.LnyOcIg-wgb6eM5G2UTVwAHaEK?w=308&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.LnyOcIg-wgb6eM5G2UTVwAHaEK?w=308&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.LnyOcIg-wgb6eM5G2UTVwAHaEK?w=308&h=180&c=7&r=0&o=5&pid=1.7',
  ];*/
  final List<String> images = [
   'assets/images/c1.jpg',
   'assets/images/c2.jpg',
   'assets/images/c3.jpg',
   'assets/images/c4.jpg',
   'assets/images/c5.jpg',
   'assets/images/c6.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0.h,left: 10.0.w,right: 12.0.w,),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Gallery ',style: TextStyle(color: Colors.black,fontSize: 18.0.w,fontWeight: FontWeight.w400),),
                  SizedBox(width: 5.0.w,),
                  Text('(${images.length})',style: TextStyle(color: myBlueColor.withOpacity(0.9),fontSize: 16.0.w,fontWeight: FontWeight.w500),),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.add_photo_alternate_outlined,color: myBlueColor,),
                  SizedBox(width: 5.0.w,),
                  Text('add photo',style: TextStyle(color: myBlueColor,fontSize: 14.0.w,fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          ),
        ),

        GridView.count(padding: EdgeInsets.zero,
          crossAxisCount: 2,crossAxisSpacing: 6.w,mainAxisSpacing: 6.w,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            for(int i = 0; i < images.length; i++)...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.w),
                child: Container(width: 325.w,height: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    // color: Colors.blue
                    image: DecorationImage(fit: BoxFit.cover,
                      image: AssetImage(images[i])
                    )
                    ),
                   // child: CachedNetworkImage(fit: BoxFit.cover,imageUrl: 'https://images.unsplash.com/photo-1587351021759-3e566b6af7cc?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
