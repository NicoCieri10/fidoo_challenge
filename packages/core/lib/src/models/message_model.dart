enum Sender {
  user,
  other,
}

class Message {
  const Message({
    required this.text,
    required this.time,
    this.senderId,
    this.sender,
  });

  final String text;
  final DateTime time;
  final String? senderId;
  final Sender? sender;
}
