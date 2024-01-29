
class ChatUsers{
  String? text;
  String? messageText;
  String? imageURL;
  String? time;
  ChatUsers({ this.text, this.messageText, this.imageURL, this.time});

  static List<ChatUsers> chats =[
    ChatUsers(text: "Carla Schoen", messageText: "Perfect, will check it", imageURL: "imageURLs/userimageURL1.jpeg", time: "09:34 PM"),
    ChatUsers(text: "Glady's Murphy", messageText: "Thanks", imageURL: "imageURLs/userimageURL2.jpeg", time: "09:34 PM"),
    ChatUsers(text: "Deanna Botsford V", messageText: "Welcome!", imageURL: "imageURLs/userimageURL3.jpeg", time: "09:10 PM"),
    ChatUsers(text: "Philip Fox", messageText: "Good Morning!", imageURL: "imageURLs/userimageURL4.jpeg", time: "28 Mar"),
    ChatUsers(text: "Debra Hawkins", messageText: "Can i check that?", imageURL: "imageURLs/userimageURL5.jpeg", time: "23 Mar"),
    ChatUsers(text: "Annette Frisch", messageText: "Thanks", imageURL: "imageURLs/userimageURL6.jpeg", time: "17 Mar"),
    ChatUsers(text: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "imageURLs/userimageURL7.jpeg", time: "24 Feb"),
    ChatUsers(text: "John Wick", messageText: "That's Great", imageURL: "imageURLs/userimageURL8.jpeg", time: "18 Feb"),
  ];
}
