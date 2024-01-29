
import 'dart:io' show Platform;
import 'package:co_rhema/User/views/remote_test_screen.dart';
import 'package:co_rhema/core/constant/platform_check.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:co_rhema/binding.dart';
import 'package:co_rhema/core/constant/theme.dart';
import 'package:co_rhema/core/func_utils/check_internet.dart';
import 'package:co_rhema/core/localization/change_local.dart';
import 'package:co_rhema/core/localization/translations.dart';
import 'package:co_rhema/core/services/helper/init_helper.dart';
import 'package:co_rhema/core/services/routes.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHelper();
  await GetStorage.init();

  runApp( MyApp());
}

Future setWindowSize() async{
  Size size = await DesktopWindow.getWindowSize();
  debugPrint('$size');
  await DesktopWindow.setWindowSize(const Size(1024,768));

  await DesktopWindow.setMinWindowSize(const Size(400,400));
  await DesktopWindow.setMaxWindowSize(const Size(800,800));

}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  String platform = 'Unknown';


  @override
  Widget build(BuildContext context) {

   PlatformCheck.checkPlatform();
    /*
       // Check if running on web
    if (kIsWeb) {
      platform = 'Web';
    } else {
      // Check for other platforms
      if (defaultTargetPlatform == TargetPlatform.android) {
        platform = 'Android';
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        platform = 'iOS';
      } else if (defaultTargetPlatform == TargetPlatform.windows) {
        platform = 'Windows';
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        platform = 'Linux';
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        platform = 'macOS';
      }
    }
     */
    Size size = MediaQuery.of(context).size;
    LocalController lController = Get.put(LocalController());
    // Locale currentLocale = Localizations.localeOf(context);
    // bool isRTL = currentLocale.languageCode.toLowerCase() == 'ar';

    return ScreenUtilInit(

      designSize:    PlatformCheck.phsDevice ? const Size(325, 812) : Size(size.width, size.height),
      // designSize: const Size(800, 1000),
      // designSize: const Size(325, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          locale: lController.language,
          // locale: lController.changeLanguage('en'),
          translations: AppTranslation(),
          debugShowCheckedModeBanner: false,
          title: 'Doctor App',
          theme: lController.appTheme,
          // theme: lightTheme(),
          darkTheme: darkTheme(),
          // home:MyHomePage(),
          // home:Scaffold(
          //   body: PrivacyScreen(),
          // ),
          // routes: routes,
          initialBinding: AppBinding(),
          getPages:pageRoutes,
          // getPages:docRoutes,
        );
      },
    );
  }
  //TextButton(onPressed:(){controller.goToForgetPassword();},child: Text("16".tr,style: TextStyle(color: Colors.blue,fontSize: 12.w),)),
}


///adb: failed to install D:\const\co_rhema\build\app\outputs\flutter-apk\app-debug.apk: Failure [INSTALL_PARSE_FAILED_NO_CERTIFICATES: Failed to collect certificates from /data/app/vmdl1224921482.tmp/base.apk
///using APK Signature Scheme v2: SHA-256 digest of contents did not verify]

/*
{"status":"success",
"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ODk0MmViNDBlMWJlYzRhNTM4MzczMyIsImlhdCI6MTcwMzQ5NDM4MCwiZXhwIjoxNzExMjcwMzgwfQ.TDC3a-kg0j-vzHEBlg06M8tRUfWFEkUYI9ZEbKuZFmY",
"data":{"user":{"name":"Mohamed","email":"mohamedali@example.com","medicalId":45983220,"ratingsAverage":4,"ratingsQuantity":0,"active":true,"_id":"658942eb40e1bec4a5383733",
"__v":0,
"id":"658942eb40e1bec4a5383733"}}} */
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     LocalController lController = Get.put(LocalController());
//     return ScreenUtilInit(
//       designSize: const Size(325, 825),
//       // designSize: const Size(375, 812),
//       minTextAdapt: true, splitScreenMode: true,
//       builder: (BuildContext context, Widget? child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           locale: lController.language,
//           translations: AppTranslation(),
//           title: 'Doctor App',
//           theme: lController.appTheme,
//           home: OnBoardingScreen(),
//           routes: routes,
//           initialBinding: AppBinding(),
//         );
//       },
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFormField Popup Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                labelText: 'Type something...',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Open the keyboard when the screen is loaded
    _focusNode.requestFocus();
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Replace with the actual number of chat messages
              itemBuilder: (context, index) {
                // Replace with your chat message widget
                return ListTile(
                  title: Text('Bot Response'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    key: Key('chatInput'),
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                ElevatedButton(
                  key: Key('sendButton'),
                  onPressed: () {
                    // Simulate sending the message (you should implement the actual logic)
                    setState(() {
                      // Handle sending message logic
                    });
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var res;
  invalidData()async{
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    invalidData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _currentDate = DateTime.now();
// final _dayFormatter = DateFormat('d');
final _dayFormatter = DateFormat('EEEE');
final _monthFormatter = DateFormat('MMM');

@override
Widget build(BuildContext context) {
  final dates = <Widget>[];

  for (int i = 0; i < 5; i++) {
    final date = _currentDate.add(Duration(days: i));
    dates.add(Column(
      children: [
        Text(_dayFormatter.format(date).substring(0,3)),
        Text(_monthFormatter.format(date)),
      ],
    ));
  }

  return Scaffold(
    appBar: AppBar(
      title: Text('Tests'),
    ),
    body: Row(
      children: dates.map((widget) => Expanded(child: widget)).toList(),
    ),
  );    return const Placeholder();
  }
// List months = ['jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'];
//
// DateTime today = DateTime.now();
// var currentDate = today.day;
// var monthOfCurrentDate = months[today.month +1];
//
// DateTime futureDate = DateTime.now().add(Duration(days: 5));
// var dayOfFutureDate = futureDate.day;
// var monthOfFutureDate = months[futureDate.month+1];
// Column(
// children: [
// Text(currentDate.toString()),
// Text(monthOfCurrentDate)
// ],

}

///https://www.freepik.com/photos/female-doctor#referrer=detail&resource=1625209

//https://www.figma.com/file/mbF3x8jWAYbtRSqA2qjxXj/Doctor-Appointment-App-UI-Design-(Community)?type=design&node-id=0-1&mode=design&t=d1hzcJNImb5GYhbW-0