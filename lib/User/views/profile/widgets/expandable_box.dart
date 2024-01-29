import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/help_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ExpandableBox extends StatelessWidget {
  const ExpandableBox({
    required this.controller,
    required this.list,
    required this.subList,
    required this.subTitle,
    required this.panelIndex,
    this.leadingIcon,
    this.isContact = false,
    super.key,
  });
  final HelpCenterControllerImp controller;
  final dynamic list,subList;
  final String subTitle;
  final bool isContact;
  final int panelIndex;
  final IconData? leadingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expandIconColor: myBlueColor,
        children: [

          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: isContact ? Icon(leadingIcon) : null,
                title: Text(list,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.w,fontWeight: FontWeight.w500),),
                // trailing: Icon(MaterialIcons.arrow_drop_down_circle),
              );
            },
            body: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.symmetric(horizontal: 16.w),
                  color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
                AnimatedContainer(
                  constraints: BoxConstraints(
                      maxHeight: 118.h
                  ),
                  duration: const Duration(milliseconds: 300),
                  // height: controller.expand ? 100.0 : 0.0,
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    padding: EdgeInsets.all(12.0.w),
                    child: Text(subTitle,style: Theme.of(context).textTheme.titleSmall,),
                  ),
                ),
              ],
            ),
            isExpanded: subList,canTapOnHeader: true,
          ),
        ],
        expansionCallback: (_, bool isExpanded) {
          controller.expandContainer(panelIndex,isExpanded);
        },
      ),
    );

/*
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expandIconColor: myBlueColor,
        children: [

          for(int i = 0 ; i < list.length  ; i ++)...[
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(list[i],style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12.w,fontWeight: FontWeight.w500),),
                  // trailing: Icon(MaterialIcons.arrow_drop_down_circle),
                );
              },
              body: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: EdgeInsets.symmetric(horizontal: 16.w),
                    color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
                  AnimatedContainer(
                    constraints: BoxConstraints(
                        maxHeight: 118.h
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
              isExpanded: subList[i],canTapOnHeader: true,
            ),
          ]
        ],
        expansionCallback: (int panelIndex, bool isExpanded) {
          controller.expandContainer(panelIndex,isExpanded);
        },
      ),
    );
*/

  }
}
/*
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Click to Expand',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: controller.expand ? 118.h : 0.0,
            curve: Curves.fastOutSlowIn,
            child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(16.0),
              child: Text('100'.tr,style: Theme.of(context).textTheme.titleSmall,),

            ),
          ),
        ],
      ),
    );
 */
