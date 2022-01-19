class MessageBModel {
  int? userId;
  String? userName;
  String? userName2;
  String? messageText;

  MessageBModel({
    this.userId,
    this.userName,
    this.messageText,
  });
  MessageBModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"]?.toInt();
    userName = json["userName"]?.toString();
    userName2 = json["userName2"]?.toString();
    messageText = json["messageText"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["userId"] = userId;
    data["userName"] = userName;
    data["userName2"] = userName2;

    data["messageText"] = messageText;

    return data;
  }
}
