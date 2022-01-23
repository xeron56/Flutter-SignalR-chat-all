class NewuserConnectedModel {
  int? connectionId;
  String? userId;
  String? chatUserName;
  String? isMeOffline;
  String? isMeInvisible;

  NewuserConnectedModel({
    this.connectionId,
    this.userId,
    this.chatUserName,
    this.isMeOffline,
    this.isMeInvisible,
  });

  NewuserConnectedModel.fromJson(Map<String, dynamic> json) {
    connectionId = json['connectionId'];
    userId = json['userId'];
    chatUserName = json['chatUserName'];
    isMeOffline = json['isMeOffline'];
    isMeInvisible = json['isMeInvisible'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['connectionId'] = this.connectionId;
    data['userId'] = this.userId;
    data['chatUserName'] = this.chatUserName;
    data['isMeOffline'] = this.isMeOffline;
    data['isMeInvisible'] = this.isMeInvisible;

    return data;
  }
}
