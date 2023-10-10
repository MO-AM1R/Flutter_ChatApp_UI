class Message {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime sentAt;

  const Message({
    required this.senderId,
    required this.recipientId,
    required this.text,
    required this.sentAt
  });

  static List<Message> messages = [
    Message(
      senderId: '1',
      recipientId: '2',
      text: 'Hey, how are you?',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: '1',
      recipientId: '2',
      text: 'My name is Mohamed Amir.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 30),
      ),
    ),
    Message(
      senderId: '2',
      recipientId: '1',
      text: 'I am good, thanks.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 120),
      ),
    ),
    Message(
      senderId: '2',
      recipientId: '1',
      text: 'Good name, my is Ahmed Ibrahim.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 200),
      ),
    ),
    Message(
      senderId: '1',
      recipientId: '3',
      text: 'Hey, how are you?',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: '1',
      recipientId: '3',
      text: 'My name is Ali Islam.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 120),
      ),
    ),
    Message(
      senderId: '3',
      recipientId: '1',
      text: 'I am good, thanks.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 200),
      ),
    ),
    Message(
      senderId: '3',
      recipientId: '1',
      text: 'Good name, my is Ali Islam.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 300),
      ),
    ),
    Message(
      senderId: '3',
      recipientId: '1',
      text: 'Can i ask you something ?',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 320),
      ),
    ),
    Message(
      senderId: '1',
      recipientId: '4',
      text: 'Hey, how are you?',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10),
    ),
    Message(
      senderId: '4',
      recipientId: '1',
      text: 'I am good, thanks.',
      sentAt: DateTime(2022, 08, 01, 10, 10, 10).add(
        const Duration(seconds: 250),
      ),
    ),
    Message(
      senderId: '1',
      recipientId: '5',
      text: 'Hey, how are you?',
      sentAt: DateTime(2023, 08, 30, 10, 10, 20),
    ),
  ];
}
