import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Message {
  final String sender;
  final String content;
  final bool isBot;

  Message(this.sender, this.content, {this.isBot = false});
}

class ChatTestPage extends StatefulWidget {
  @override
  _ChatTestPageState createState() => _ChatTestPageState();
}

class _ChatTestPageState extends State<ChatTestPage> with TickerProviderStateMixin {
  final List<Message> messages = [];
  final ChatSimulator chatSimulator = ChatSimulator();

  TextEditingController _messageController = TextEditingController();
  late AnimationController _typingController;

  @override
  void initState() {
    super.initState();
    _typingController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _typingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat with Bot'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageWidget(messages[index],_typingController);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _sendMessage,
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final userMessage = _messageController.text;
    _messageController.clear();

    // Simulate sending user message
    _addMessage(Message('User', userMessage));

    // Simulate typing animation
    _startTypingAnimation();

    // Simulate bot response after typing
    final botResponse = await chatSimulator.simulateBotResponse(userMessage);
    _stopTypingAnimation();

    // Display bot response
    _addMessage(Message('Bot', botResponse, isBot: true));
  }

  void _addMessage(Message message) {
    setState(() {
      messages.add(message);
    });
  }

  void _startTypingAnimation() {
    _typingController.repeat(reverse: true);
  }

  void _stopTypingAnimation() {
    _typingController.reset();
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  final AnimationController typingController;

  MessageWidget(this.message, this.typingController);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'User' ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        height: 40,
        constraints: BoxConstraints(
          maxWidth: 200,
          // maxHeight: 40,
        ),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.sender == 'User' ? Colors.blue : Colors.cyan,
          borderRadius: message.isBot ? const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),bottomLeft: Radius.circular(8.0),) : const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0),) ,
        ),
        child: message.isBot
            ? AnimatedBuilder(
          animation: typingController,
          builder: (context, child) {
            return Opacity(
              opacity: typingController.value,
              child: child,
            );
          },
          child: _buildTypingWidget(),
        )
            : Text(
          message.content,
          style:const TextStyle(color: Colors.white,fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildTypingWidget() {
    return Row(
      children: [
        Text('Typing...',          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 8.0),
        Loader(),
      ],
    );
  }
}


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 2,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[300],color: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}

class ChatSimulator {
  final List<Map<String, dynamic>> chatData = [
    {
      "id": "builtin_text-LVO4fK",
      "formData": {"text": "Hello", "markdown": true, "typing": true},
      "createdBy": "admin",
      "createdOn": "2024-01-26T15:02:11.482Z",
      "modifiedOn": "2024-01-26T15:02:11.482Z"
    },
    {
      "id": "builtin_text-ODz5ji",
      "formData": {"text": "What\'s your Name", "markdown": true, "typing": true},
      "createdBy": "admin",
      "createdOn": "2024-01-26T15:04:25.040Z",
      "modifiedOn": "2024-01-26T15:04:25.040Z"
    },
    {
      "id": "builtin_text-YIbpL_",
      "formData": {
        "text": "Nice to meet you Amr!",
        "markdown": true,
        "typing": true
      },
      "createdBy": "admin",
      "createdOn": "2024-01-26T15:20:06.118Z",
      "modifiedOn": "2024-01-26T16:02:20.395Z"
    }
  ];

  Future<String> simulateBotResponse(String userMessage) async {
    // Simulate bot response based on predefined data
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    for (var message in chatData) {
      final formData = message['formData'];
      final userText = formData['text'].toLowerCase();

      if (userText == userMessage.toLowerCase() && (userMessage.toLowerCase() == 'hello' || userMessage.toLowerCase() == 'hey' || userMessage.toLowerCase() == 'hi')) {
        // Simulate bot response based on predefined data
        return formData['text'];
      }else{

      }
    }

    // Default response if no match is found
    return "I'm sorry, I didn't understand that.";


  // List<Map<String, dynamic>> chatData = [];
  //
  // // Load JSON data from assets
  // Future<void> loadChatData() async {
  //   String jsonData = await rootBundle.loadString('assets/bots/bot.json');
  //   chatData = List<Map<String, dynamic>>.from(json.decode(jsonData));
  // }
  // // Modify your chat simulator logic accordingly
  //
  // Future<String> simulateBotResponse(String userMessage) async {
  //   // Simulate bot response based on predefined data
  //   await Future.delayed(const Duration(seconds: 2)); // Simulate delay
  //   for (var message in chatData) {
  //     final formData = message['formData'].toLowerCase();
  //     final userText = formData['text'].toLowerCase();
  //
  //     if (userText == userMessage.toLowerCase() &&
  //         (userMessage.toLowerCase() == 'hello' ||
  //             userMessage.toLowerCase() == 'hey' ||
  //             userMessage.toLowerCase() == 'hi')) {
  //       // Simulate bot response based on predefined data
  //       debugPrint('YAAAAAAAAAAAAAAAAAAAAAAAAAAAYAB');
  //       return formData['text'];
  //     } else if (userMessage.toLowerCase() == 'Amr') {
  //       debugPrint('Nice to meet you Amr!');
  //       return 'Nice to meet you Amr!';
  //     } else {
  //       return "I'm sorry, I didn't understand that.";
  //     }
  //   }
  //
  //   // Default response if no match is found
  //   return "I'm sorry, I didn't understand that.";
  }

  // Future<String> simulateBotResponse(String userMessage) async {
  //   await Future.delayed(const Duration(seconds: 2)); // Simulate delay
  //
  //   if (userMessage.toLowerCase() == 'hello' ||
  //       userMessage.toLowerCase() == 'hi' ||
  //       userMessage.toLowerCase() == 'hey') {
  //     return 'Hello\nWhat\'s your name?';
  //   } else if (userMessage.toLowerCase() == 'Amr') {
  //     return 'Nice to meet you Amr!';
  //   } else {
  //     return "I'm sorry, I didn't understand that.";
  //   }
  // }
}

// class ChatSimulator {
//   final List<Map<String, dynamic>> chatData = [
//     {
//       "id": "builtin_text-LVO4fK",
//       "formData": {"text": "Hello", "markdown": true, "typing": true},
//       "createdBy": "admin",
//       "createdOn": "2024-01-26T15:02:11.482Z",
//       "modifiedOn": "2024-01-26T15:02:11.482Z"
//     },
//     {
//       "id": "builtin_text-ODz5ji",
//       "formData": {"text": "What\'s your Name", "markdown": true, "typing": true},
//       "createdBy": "admin",
//       "createdOn": "2024-01-26T15:04:25.040Z",
//       "modifiedOn": "2024-01-26T15:04:25.040Z"
//     },
//     {
//       "id": "builtin_text-YIbpL_",
//       "formData": {
//         "text": "Nice to meet you Amr!",
//         "markdown": true,
//         "typing": true
//       },
//       "createdBy": "admin",
//       "createdOn": "2024-01-26T15:20:06.118Z",
//       "modifiedOn": "2024-01-26T16:02:20.395Z"
//     }
//   ];
//
//   String simulateBotResponse(String userMessage) {
//     for (var message in chatData) {
//       final formData = message['formData'];
//       final userText = formData['text'].toLowerCase();
//
//       if (userText == userMessage.toLowerCase() ) {
//         // Simulate bot response based on predefined data
//         return formData['text'];
//       }
//     }
//
//     // Default response if no match is found
//     return "I'm sorry, I didn't understand that.";
//   }
// }

//
// class RemoteTestScreen extends StatelessWidget {
//   const RemoteTestScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       body: GetBuilder<TestController>(builder: (controller){
//         return HandlingDataView(request:controller.statusRequest ,
//           widget:ListView.builder(
//           itemCount: controller.data.length,
//           itemBuilder: (context,index) {
//             return Text('${controller.data}');
//           },
//
//         ) ,);
//         // if(controller.statusRequest == StatusRequest.LOADING){
//         //   return const Center(child: CircularProgressIndicator(),);
//         // }else if(controller.statusRequest == StatusRequest.OFFLINEFAILURE){
//         //   return const Center(child: Text('OFFLINE FAILURE'),);
//         // }else if(controller.statusRequest == StatusRequest.SERVERFAILURE){
//         //   return const Center(child: Text('SERVER FAILURE'),);
//         // }else if(controller.statusRequest == StatusRequest.FAILURE){
//         //   return const Center(child: Text('GET DATA FAILURE!!'),);
//         // }else{
//         //   return ListView.builder(
//         //     itemCount: controller.data.length,
//         //     itemBuilder: (context,index) {
//         //       return Text('${controller.data}');
//         //     },
//         //
//         //   );
//         // }
//       }),
//     );
//   }
// }


/**

    class Message {
    final String sender;
    final String content;
    final bool isBot;

    Message(this.sender, this.content, {this.isBot = false});
    }
    class ChatTestPage extends StatefulWidget {
    @override
    _ChatTestPageState createState() => _ChatTestPageState();
    }

    class _ChatTestPageState extends State<ChatTestPage> with TickerProviderStateMixin{
    final List<Message> messages = [];
    final ChatSimulator chatSimulator = ChatSimulator();

    TextEditingController _messageController = TextEditingController();
    late AnimationController _typingController;

    @override
    void initState() {
    super.initState();
    _typingController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
    );
    }

    @override
    void dispose() {
    _typingController.dispose();
    super.dispose();
    }

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    appBar: AppBar(
    title: Text('Chat with Bot'),
    ),
    body: Column(
    children: [
    Expanded(
    child: ListView.builder(
    itemCount: messages.length,
    itemBuilder: (context, index) {
    return MessageWidget(messages[index]);
    },
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    children: [
    Expanded(
    child: TextField(
    controller: _messageController,
    decoration: InputDecoration(
    hintText: 'Type a message...',
    ),
    ),
    ),
    ElevatedButton(
    onPressed: _sendMessage,
    child: Text('Send'),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    );
    }

    void _sendMessage() async {
    final userMessage = _messageController.text;
    _messageController.clear();

    // Simulate sending user message
    _addMessage(Message('User', userMessage));

    // Simulate typing animation
    _startTypingAnimation();

    // Simulate bot response after typing
    final botResponse = await chatSimulator.simulateBotResponse(userMessage);
    _stopTypingAnimation();

    // Display bot response
    _addMessage(Message('Bot', botResponse, isBot: true));
    }

    void _addMessage(Message message) {
    setState(() {
    messages.add(message);
    });
    }

    void _startTypingAnimation() {
    _typingController.repeat(reverse: true);
    }

    void _stopTypingAnimation() {
    _typingController.reset();
    }
    }

    class MessageWidget extends StatelessWidget {
    final Message message;

    MessageWidget(this.message);

    @override
    Widget build(BuildContext context) {
    return Align(
    alignment: message.sender == 'User' ? Alignment.topLeft : Alignment.topRight,
    child: Container(
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
    color: message.sender == 'User' ? Colors.blue : Colors.green,
    borderRadius: message.isBot ? const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),bottomLeft: Radius.circular(8.0),) : const BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0),bottomRight: Radius.circular(8.0),) ,
    ),
    child: message.isBot
    ? AnimatedBuilder(
    animation: _typingController,
    builder: (context, child) {
    return Opacity(
    opacity: _typingController.value,
    child: child,
    );
    },
    child: _buildTypingWidget(),
    )
    : Text(
    message.content,
    style: TextStyle(color: Colors.white),
    ),),
    );
    }
    Widget _buildTypingWidget() {
    return Row(
    children: [
    Text('Typing...'),
    SizedBox(width: 8.0),
    CircularProgressIndicator(),
    ],
    );
    }

    }

    class ChatSimulator {
    final List<Map<String, dynamic>> chatData = [
    {
    "id": "builtin_text-LVO4fK",
    "formData": {"text": "Hello", "markdown": true, "typing": true},
    "createdBy": "admin",
    "createdOn": "2024-01-26T15:02:11.482Z",
    "modifiedOn": "2024-01-26T15:02:11.482Z"
    },
    {
    "id": "builtin_text-ODz5ji",
    "formData": {"text": "What\'s your Name", "markdown": true, "typing": true},
    "createdBy": "admin",
    "createdOn": "2024-01-26T15:04:25.040Z",
    "modifiedOn": "2024-01-26T15:04:25.040Z"
    },
    {
    "id": "builtin_text-YIbpL_",
    "formData": {
    "text": "Nice to meet you Amr!",
    "markdown": true,
    "typing": true
    },
    "createdBy": "admin",
    "createdOn": "2024-01-26T15:20:06.118Z",
    "modifiedOn": "2024-01-26T16:02:20.395Z"
    }
    ];

    Future<String> simulateBotResponse(String userMessage) async {
    // Simulate bot response based on predefined data
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    for (var message in chatData) {
    final formData = message['formData'];
    final userText = formData['text'].toLowerCase();

    if (userText == userMessage.toLowerCase() && (userMessage.toLowerCase() == 'hello' || userMessage.toLowerCase() == 'hey' || userMessage.toLowerCase() == 'hi')) {
    // Simulate bot response based on predefined data
    return formData['text'];
    }else{

    }
    }

    // Default response if no match is found
    return "I'm sorry, I didn't understand that.";
    }


    }
  */