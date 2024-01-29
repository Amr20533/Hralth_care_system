import 'package:co_rhema/constants.dart';
import 'package:co_rhema/controllers/help_center_controller.dart';
import 'package:co_rhema/User/views/profile/widgets/expandable_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpCenterControllerImp>(builder: (controller){
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(int i = 0 ; i < controller.contactList.length  ; i ++)...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.zero,
                  // expandIconColor: myBlueColor,
                  children: [

                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                        leading: Icon(controller.icons[i],color: myBlueColor,size: 24.w,),
                        title: Text(controller.contactTitle[i],style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14.w,fontWeight: FontWeight.w500),),
                          // trailing: Icon(MaterialIcons.arrow_drop_down_circle),
                        );
                      },
                      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.symmetric(horizontal: 16.w),
                            color: const Color(0XFF838383).withOpacity(0.2),height: 1.h,),
                          SizedBox(height: 4.h ,),
                          AnimatedContainer(
                            constraints: BoxConstraints(
                                maxHeight: 128.h,
                            ),
                            duration: const Duration(milliseconds: 300),
                            // height: controller.isExpandedList[i] ? 70.h : 0.0,
                            curve: Curves.fastOutSlowIn,
                            child:i > 0 ? Container(
                              padding: EdgeInsets.all(12.0.w),
                              child: Row(
                                children: [
                                  SizedBox(width: 15.w ,),
                                  Container(width: 8.h,height: 8.h,decoration: BoxDecoration(color: myBlueColor.withOpacity(0.8),shape: BoxShape.circle),),
                                  SizedBox(width: 8.w ,),
                                  Text(controller.contactList[i],style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12.w),),
                                ],
                              ),
                              ) : Container(
                              padding: EdgeInsets.all(12.0.w),
                              child: Text(controller.contactList[i],style: Theme.of(context).textTheme.titleSmall,),
                            ),
                          ),
                          SizedBox(height: 4.h ,),
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
            // ExpandableContainer(),
          ],
        ),
      );
    });
  }
}
