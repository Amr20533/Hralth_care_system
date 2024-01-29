class Message{
  final String senderId,recipientId,messageText;
  final DateTime createdAt;
  Message({
    required this.senderId,
    required this.recipientId,
    required this.messageText,
    required this.createdAt,
    // required this.id,
  });
  static  List<Message> Messages = [
    Message(senderId: '1', recipientId: '2', messageText: 'Hey, How are you?', createdAt: DateTime(2023,00,01,10,10,10)),
    // Message(senderId: '1', recipientId: '2', messageText: 'He,y How are you?', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 300))),
    // Message(senderId: '2', recipientId: '1', messageText: 'Hey How are you?', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 300))),
    // Message(senderId: '1', recipientId: '4', messageText: 'Hey How are you?', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 300))),
    Message(senderId: '1', recipientId: '2', messageText: 'I\'m staying here today.', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 30))),
    Message(senderId: '2', recipientId: '1', messageText: 'Hey,I\'m good thanks, What are you doing here today?', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 120))),
    Message(senderId: '4', recipientId: '1', messageText: 'Hey How are you?', createdAt: DateTime(2023,00,01,10,10,10).add(const Duration(seconds: 120))),

  ];
}