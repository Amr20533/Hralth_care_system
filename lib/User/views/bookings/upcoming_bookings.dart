import 'package:co_rhema/constants.dart';
import 'package:co_rhema/User/modules/speciality.dart';
import 'package:co_rhema/User/views/bookings/widgets/booking_card.dart';
import 'package:co_rhema/User/views/favs/widgets/choice_button.dart';
import 'package:co_rhema/User/views/home/details_screen.dart';
import 'package:co_rhema/User/views/home/widgets/specialisit_card.dart';
import 'package:co_rhema/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class UpcomingBookings extends StatelessWidget {
  const UpcomingBookings({required this.phs, Key? key,}) : super(key: key);
  final dynamic phs;
  // final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: ListView.separated(
        itemCount: phs.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
        itemBuilder: (context,index) => BookingCard(
                phs: phs[index],
            ),
        separatorBuilder: (context,index) => SizedBox(height: 12.0.w,),
      ),
    );
  }

}
