class ChatModel {
  final int id;
  final String name;
  final bool isGroup;
  final String time;
  final String message;
  final String status;
  bool isSelect;
  ChatModel({
    required this.id,
    required this.name,
    required this.isGroup,
    required this.time,
    required this.message,
    required this.status,
    required this.isSelect,
  });
}
