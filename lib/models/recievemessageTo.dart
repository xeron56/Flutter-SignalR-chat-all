class ReceiveMessageTo {
  String? toUserId;
  String? FromChatUserName;
  String? ToChatUserName;

  String? message;

  ReceiveMessageTo({
    this.toUserId,
    this.FromChatUserName,
    this.ToChatUserName,
    this.message,
  });

  ReceiveMessageTo.fromJson(Map<String, dynamic> json) {
    toUserId = json['toUserId'];
    FromChatUserName = json['FromChatUserName'];
    ToChatUserName = json['ToChatUserName'];

    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['toUserId'] = this.toUserId;
    data['FromChatUserName'] = this.FromChatUserName;
    data['ToChatUserName'] = this.ToChatUserName;

    data['message'] = this.message;

    return data;
  }
}
