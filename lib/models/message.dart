class Message {

  String senderId = "";
  String receiverId = "";
  String message = "";
  String avatar = "";
  DateTime? date_created;

  Message({required this.senderId, required this.receiverId, required this.message, required this.date_created});
}