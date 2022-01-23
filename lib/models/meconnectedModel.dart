// class MeconnectedModel {
//   String? connectionId;
//   String? userId;
//   String? chatUserName;
//   String? isOffline;
//   String? isInvisible;
//   DateTime actionTime;

//   MeconnectedModel({
//     this.connectionId,
//     this.userId,
//     this.chatUserName,
//     this.isOffline,
//     this.isInvisible,
//     required this.actionTime,
//   });

//   factory MeconnectedModel.fromJson(Map<String, dynamic> json) =>
//       MeconnectedModel(
//         connectionId: json["connectionId"],
//         userId: json["userId"],
//         chatUserName: json["chatUserName"],
//         isOffline: json["isOffline"],
//         isInvisible: json["isInvisible"],
//         actionTime: DateTime.parse(json["actionTime"]),
//       );
//   //make to json
//   Map<String, dynamic> toJson() => {
//         "connectionId": connectionId,
//         "userId": userId,
//         "chatUserName": chatUserName,
//         "isOffline": isOffline,
//         "isInvisible": isInvisible,
//         "actionTime": actionTime.toIso8601String(),
//       };
// }

import 'dart:convert';

class MeconnectedModel {
  String? connectionId;
  String? userId;
  String? chatUserName;
  bool? isOffline;
  bool? isInvisible;
  String? actionTime;

  MeconnectedModel({
    this.connectionId,
    this.userId,
    this.chatUserName,
    this.isOffline,
    this.isInvisible,
    this.actionTime,
  });

  factory MeconnectedModel.fromMap(Map<String, dynamic> data) =>
      MeconnectedModel(
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
  factory MeconnectedModel.fromJson(String data) {
    return MeconnectedModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServerModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
