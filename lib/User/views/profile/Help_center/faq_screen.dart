import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/help_center_controller.dart';
import 'package:co_rhema/User/views/profile/widgets/expandable_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpCenterControllerImp>(builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 58.h,
            child: ListView.builder(
              itemCount: controller.filterList.length,scrollDirection: Axis.horizontal,padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),shrinkWrap: true,
              itemBuilder: (context,index) {
                final item = controller.filterList[index];
                final bool isSelected = controller.selectedItems.contains(item);
                return GestureDetector(
                  onTap: ()
                  {
                    controller.toggleItem(item);
                  },
                  child: Container(
                      padding: EdgeInsets.only(left:14.h,right:14.h,top: 10.0.h,bottom: 5.0.h,),
                      margin: EdgeInsets.only(top:8.h,bottom:8.h,left: 12.w),
                      decoration: BoxDecoration(
                        color: isSelected ? myBlueColor : const Color(0XFFF2F2F2),
                        borderRadius: BorderRadius.circular(18.w),
                        border:Border.all(color:const Color(0XFF838383).withOpacity(0.1),width: 1),
                      ),
                      child:Text(controller.filterList[index],style: Theme.of(context).textTheme.titleSmall!.copyWith(color: isSelected ? Colors.white : const Color(0XFF797979),fontSize: 18.h,fontWeight: FontWeight.w400),)
                  ),
                );},
            ),
          ),
          // ExpandableBox(controller: controller,list: controller.expandedTitles,subList: controller.isExpandedList,),
          for(int i = 0 ; i < controller.expandedTitles.length  ; i ++)...[
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.zero,
              expandIconColor: myBlueColor,
              children: [

                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(controller.expandedTitles[i],style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.w,fontWeight: FontWeight.w500),),
                        // trailing: Icon(MaterialIcons.arrow_drop_down_circle),
                      );
                    },
                    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(margin: EdgeInsets.symmetric(horizontal: 16.w),
                          color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
                        AnimatedContainer(
                          constraints: BoxConstraints(
                              maxHeight: 128.h
                          ),
                          duration: const Duration(milliseconds: 300),
                          // height: controller.expand ? 100.0 : 0.0,
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                            padding: EdgeInsets.all(12.0.w),
                            child: Text('100'.tr,style: Theme.of(context).textTheme.titleSmall,),
                          ),
                        ),
                      ],
                    ),
                    isExpanded: controller.isExpandedList[i],canTapOnHeader: true,
                  ),
              ],
              expansionCallback: (int panelIndex, bool isExpanded) {
                controller.expandContainer(i,isExpanded);
              },
            ),
          ),
          ]
        ],
      );
    });
  }
}
