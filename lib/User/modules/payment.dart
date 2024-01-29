import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Payment{
  final String? text;
  final IconData? icon;

  Payment({this.text,this.icon});
  static List<Payment> payments =[
    Payment(
      text: "Add New Card",
      icon: MaterialCommunityIcons.credit_card,
    ),
    Payment(
      text: "Paypal",
      icon: Icons.paypal,
    ),
    Payment(
      text: "Apple Pay",
      icon: FontAwesome.apple,
    ),


  ];

}