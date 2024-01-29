import 'package:co_rhema/User/modules/payment.dart';
import 'package:co_rhema/User/views/appointment/widgets/payment_option.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  List<Payment> payment = Payment.payments;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 5.0.w),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconCircle(onTap:(){Navigator.of(context).pop(true);},icon: AntDesign.arrowleft,),
                      const Spacer(flex: 4,),

                      Text('Payment Methods',style: TextStyle(color: Colors.black,fontSize: 14.w,fontWeight: FontWeight.w500),),
                      const Spacer(flex: 6,),
                    ],),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0.h,),
                    child: Text('Credit & Debit Card',style: TextStyle(color: Colors.black,fontSize: 16.0.w,fontWeight: FontWeight.w500),),
                  ),
                  ListView.builder(
                    itemCount: payment.length,scrollDirection: Axis.vertical,padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
                    itemBuilder: (context,index) => PaymentOption(
                        greyScale: index == 2? true : false,
                        onTap:(){
                      setState(() {
                        selected = index;
                      });
                    },text: payment[index].text!,icon: payment[index].icon!,isSelected: index == selected ? true : false),
                  ),

                  // Container(
                  //   width: 325.w,height: 200.w,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(16.0.w),
                  //     image: DecorationImage(fit: BoxFit.cover,
                  //       image: AssetImage('assets/images/icons/visa.jpg'),
                  //     )
                  //   ),
                  // )

                ]),
          ),),),
      // bottomNavigationBar: Container(width: double.infinity,
      //   height: 70.w,alignment: Alignment.center,
      //   decoration: BoxDecoration(color: Colors.white,
      //       boxShadow: [BoxShadow(
      //         blurRadius: 10,offset:const Offset(-4,-4),
      //         color:const Color(0XFF797979).withOpacity(0.1),
      //       )],
      //       borderRadius: BorderRadius.only(topRight: Radius.circular(14.w),topLeft: Radius.circular(14.w))),
      //   child:GestureDetector(
      //     onTap: (){
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
      //     },
      //     child: Container(width: 290.w,height: 40.w,
      //       // margin: EdgeInsets.symmetric(horizontal: 7.w),
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: myBlueColor,
      //         borderRadius: BorderRadius.circular(20.0.h),
      //       ),
      //       child: Center(
      //         child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 15.w,fontWeight: FontWeight.w400),),
      //       ),
      //     ),
      //   ) ,),
    );
  }
}
