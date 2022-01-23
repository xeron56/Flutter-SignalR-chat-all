import 'dart:convert';

class ServerModel {
  String? connectionId;
  String? userId;
  String? chatUserName;
  bool? isOffline;
  bool? isInvisible;
  String? actionTime;

  ServerModel({
    this.connectionId,
    this.userId,
    this.chatUserName,
    this.isOffline,
    this.isInvisible,
    this.actionTime,
  });

  factory ServerModel.fromMap(Map<String, dynamic> data) => ServerModel(
        connectionId: data['connectionId'] as String?,
        userId: data['userId'] as String?,
        chatUserName: data['chatUserName'] as String?,
        isOffline: data['isOffline'] as bool?,
        isInvisible: data['isInvisible'] as bool?,
        actionTime: data['actionTime'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'connectionId': connectionId,
        'userId': userId,
        'chatUserName': chatUserName,
        'isOffline': isOffline,
        'isInvisible': isInvisible,
        'actionTime': actionTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServerModel].
  factory ServerModel.fromJson(String data) {
    return ServerModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServerModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
