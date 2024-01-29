import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/OnBoardingController.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:co_rhema/User/views/auth/widgets/onBoarding/custom_button.dart';
import 'package:co_rhema/User/views/auth/widgets/onBoarding/custom_controller.dart';
import 'package:co_rhema/User/views/auth/widgets/onBoarding/custom_slider.dart';
import 'package:co_rhema/User/views/home/widgets/icon_circle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
// class OnBoardingScreen extends GetView<OnBoardingControllerImp> {
  const OnBoardingScreen({super.key});
  // LocalController lController = Get.put(LocalController());

  final bool isActive=false;


  @override
  Widget build(BuildContext context) {
    LocalController lController = Get.put(LocalController());
    // Locale currentLocale = Localizations.localeOf(context);
    // bool isRTL = currentLocale.languageCode.toLowerCase() == 'ar';
    bool isRTL = lController.language!.languageCode.toLowerCase() == 'ar';

    Size size = MediaQuery.of(context).size;
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Directionality(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          // textDirection: lController.language!.languageCode.toLowerCase() == 'ar' ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 5.0.w),
                    child: Row(
                        children:[
                      Expanded(child:Container()),
                        controller.currentPage == 2 ? Container() : TextButton(onPressed:(){
                          controller.boardingSkip();
                        },child: Text(isRTL ? "تخطي" : 'Skip' ,style: TextStyle(fontSize: 14.0.w,fontFamily: 'Cairo-Black',color: myBlueColor,))),
                    ]
                    ),
                  ),
                  const Spacer(flex:1),
                  const Expanded(
                    flex: 4,
                    child: CustomSliderOnBoarding(),
                  ),

                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Row(
                              children: [
                                controller.currentPage > 0 ? GestureDetector(
                                  onTap: (){
                                    controller.prev();
                                  },
                                  child: Container(width: 40.w,height: 40.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22.0.w),
                                      border:Border.all(color: myBlueColor.withOpacity(0.7),width: 2),
                                    ),
                                    child: Center(child: Icon(isRTL ? AntDesign.arrowright : AntDesign.arrowleft,size: 20.w,color: myBlueColor,)),
                                  ),
                                ) : SizedBox(width: 40.w,height: 40.w,),
                                const Spacer(flex: 1),
                                const CustomDotControllerOnBoarding(),
                                const Spacer(flex: 1),
                                GestureDetector(
                                  onTap: (){
                                    controller.next();
                                  },
                                  child: Container(width: 40.w,height: 40.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: myBlueColor,
                                      borderRadius: BorderRadius.circular(22.0.w),
                                      // border:Border.all(color: myBlueColor.withOpacity(0.7),width: 2),
                                    ),
                                    child: Center(child: Icon(isRTL ? AntDesign.arrowleft : AntDesign.arrowright,size: 20.w,color: Colors.white,)),
                                  ),
                                ),

                                // Padding(
                                //   padding: EdgeInsets.only(bottom: 5.h,left: 33.w,right: 33.w),
                                //   child: CustomButton(
                                //       width: 100,color: myBlueColor,
                                //       text: '8'.tr,loading: false,onTap:(){
                                //     controller.next();
                                //   }),
                                // )
                              ],
                            ),
                          )
                          // const CustomDotControllerOnBoarding(),
                          // const Spacer(flex: 2),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: size.height * 0.05,left: 33,right: 33),
                          //   child: CustomButton(text: 'Next',loading: false,onTap:(){
                          //     _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                          //   }),
                          // )
                        ],
                      ))
                ]),
              )),
        );
      }
    );
  }

/*Widget dotIndicator(int index){
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5.0),
      duration: const Duration(milliseconds: 500),
      width: currentPage == index ? 18 : 12,height: 4,
      decoration: BoxDecoration(
          color: currentPage == index ? CustomTheme.lightYellow :CustomTheme.paleYellow ,
          borderRadius: currentPage == index ? BorderRadius.circular(2.0) : BorderRadius.circular(10.0)
      ),
    );
  }*/
}

// class onBoardingBtn extends StatelessWidget {
//   onBoardingBtn({required this.onPressed,required this.title});
//   final String title;
//   final VoidCallback onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:onPressed,
//       child:Text(title,style:kBodyText),
//       splashColor:Colors.black12,
//       borderRadius:BorderRadius.circular(6),
//     );  }
// }
/*
              Expanded(
              child: PageView.builder(
                  itemCount: onBoardingList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>Stack(
                    alignment: Alignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(top: 8.0,right:10.0,child: TextButton(onPressed: (){}, child: const Text('skip',style: TextStyle(fontSize: 18.0,fontFamily: 'Cairo-Black',color: CustomTheme.lightYellow),)),
                      ),
                      Positioned(top:size.height * 0.13,right: size.width * 0.1,left: size.width * 0.1,
                          child: Image.asset('${onBoardingList[index].image}',width: 300,height: 250,fit: BoxFit.cover,)),
                      Positioned(top:size.height * 0.43,left: size.width * 0.3,
                          child: Text('${onBoardingList[index].title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize:index == 2 ?  24 : 22,fontFamily: 'Cairo-Black'), ),),
                      Positioned(top:size.height * 0.52,left: size.width * 0.27,
                        child: Text('${onBoardingList[index].body}',style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18,fontFamily: 'Cairo-Black',color: CustomTheme.grey), ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          ...List.generate(3, (index) => indicator()),
                          CustomButton(onTap: (){},text: 'Next',loading: false,),
                        ],
                      ),
                      // const SizedBox(height: 80.0,),
                      // Container(
                      //   width: size.width,alignment: Alignment.center,
                      //   child: Text(onBoardingList[index].body!, textAlign: TextAlign.center,style:const TextStyle(height: 2,color: CustomTheme.lightPurple),),
                      // ),

                    ],
                  )),
            ),



            Stack(
          children: [
            Container(
              height: 325.h,
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/top_image.png')
                )
              ) ,
              child: Container(
                padding:  EdgeInsets.only(left: 8.w,bottom:15.h),
                width: 375.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: "Athletics Shoes",style: appStyleWithHeight(42,Colors.white,FontWeight.bold,1.2),),
                    TitleText(text: "Collection",style: appStyleWithHeight(42,Colors.white,FontWeight.bold,1.2),),
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable:true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24,Colors.white,FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(text: "Mens Shoes",),
                        Tab(text: "Woman Shoes",),
                        Tab(text: "Kids Shoes",),
                      ],),

                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.265),
              child: Container(
                padding:const EdgeInsets.only(left: 12.0),
                child: TabBarView(
                    controller: _tabController,
                    children: [
                        SneakerHomeWidget(gender: productNotifier.men,tabIndex: 0,),
                        SneakerHomeWidget(gender: productNotifier.women,tabIndex: 1),
                        SneakerHomeWidget(gender: productNotifier.kids,tabIndex: 2,),
                ]),
              ),
            ),
          ],
        ),


        Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(pageController: _pageController),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(),
                        const Spacer(flex: 7),
                        const CustomDotControllerOnBoarding(),
                        const Spacer(flex: 2),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.05,left: 33,right: 33),
                          child: CustomButton(
                              width: 100,
                              text: 'Next',loading: false,onTap:(){
                            _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                          }),
                        )
                      ],
                    )
                    // const CustomDotControllerOnBoarding(),
                    // const Spacer(flex: 2),
                    // Padding(
                    //   padding: EdgeInsets.only(bottom: size.height * 0.05,left: 33,right: 33),
                    //   child: CustomButton(text: 'Next',loading: false,onTap:(){
                    //     _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    //   }),
                    // )
                  ],
                ))
          ]),
        ));
 */

