class Message {
  const Message({
    this.text,
    required this.time,
    this.senderId,
  });

  final String? text;
  final DateTime time;
  final String? senderId;
}
