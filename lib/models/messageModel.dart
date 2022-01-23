class MessageModel {
  String? connectionId;
  String? fromUserName;
  String? toUserName;
  String? message;
  bool? isMe;
  String? fromUserImage;

  MessageModel({
    this.connectionId,
    this.fromUserName,
    this.toUserName,
    this.message,
    this.isMe,
    this.fromUserImage,
  });
}
