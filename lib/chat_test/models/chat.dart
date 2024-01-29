import 'message.dart';
import 'user.dart';

class Chat{
  final String? id;
  final List<User>? users;
  final List<Message> messages;

  Chat({this.id, this.users = const <User>[], this.messages = const <Message>[]});
  Chat copyWith({
  String? id,
  List<User>? users,
  List<Message>? messages,
}){
    return Chat(id: id?? this.id,users:  users?? this.users, messages:  messages ?? this.messages);
  }
static List<Chat> chats = [
  Chat(id: '0',
  users: User.users.where((user) => user.id == '1' || user.id == '2').toList(),
  messages: Message.Messages.where((msg) => (msg.senderId == '1' || msg.senderId == '2') & (msg.recipientId == '1' || msg.recipientId == '2')).toList(),
  ),
  Chat(id: '1',
  users: User.users.where((user) => user.id == '1' || user.id == '3').toList(),
  messages: Message.Messages.where((msg) => (msg.senderId == '1' || msg.senderId == '3') & (msg.recipientId == '1' || msg.recipientId == '3')).toList(),
  ),
];
}