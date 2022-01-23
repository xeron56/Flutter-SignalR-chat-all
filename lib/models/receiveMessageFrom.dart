class ReceiveMessageFrom {
  String? fromUserId;

  String? FromChatUserName;
  String? ToChatUserName;
  String? message;

  ReceiveMessageFrom({
    this.fromUserId,
    this.FromChatUserName,
    this.ToChatUserName,
    this.message,
  });

  ReceiveMessageFrom.fromJson(Map<String, dynamic> json) {
    fromUserId = json['toUserId'];

    FromChatUserName = json['FromChatUserName'];
    ToChatUserName = json['ToChatUserName'];
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['toUserId'] = this.fromUserId;

    data['FromChatUserName'] = this.FromChatUserName;
    data['ToChatUserName'] = this.ToChatUserName;
    data['message'] = this.message;

    return data;
  }
}
