import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Package{
  final String? text,subText,price,duration;
  final IconData? icon;

  Package({this.text,this.subText,this.price,this.icon, this.duration});
  static List<Package> packages =[
    Package(
      text: "Messaging",
      price: "\$20",
      subText: "Chat with doctor",
      duration: "/30 mins",
      icon: MaterialIcons.message,
),
    Package(
      text: "Voice Call",
      price: "\$40",
      subText: "Voice call with doctor",
      duration: "/30 mins",
      icon: FontAwesome.phone,
),
    Package(
      text: "Video Call",
      price: "\$60",
      subText: "Video call with doctor",
      duration: "/30 min",
      icon: FontAwesome.video_camera,
),
    Package(
      text: "In Person",
      price: "\$100",
      subText: "In person visit with with doctor",
      duration: "/30 min",
      icon: Fontisto.person,
),

  ];

}
String dummyText="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";