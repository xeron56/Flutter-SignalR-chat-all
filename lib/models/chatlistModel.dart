// class ChatListModel {
//   String? connectionId;
//   String? userId;
//   String? chatUserName;
//   String? isOffline;
//   String? isInvisible;
//   DateTime actionTime;

//   ChatListModel({
//     this.connectionId,
//     this.userId,
//     this.chatUserName,
//     this.isOffline,
//     this.isInvisible,
//     required this.actionTime,
//   });

//   factory ChatListModel.fromJson(Map<String, dynamic> json) =>
//       ChatListModel(
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

class ChatListModel {
  String? connectionId;
  String? userId;
  String? chatUserName;
  bool? isOffline;
  bool? isInvisible;
  String? actionTime;
  String? chatrealname;
  String? chatimage;
  String? lastMessage;

  ChatListModel({
    this.connectionId,
    this.userId,
    this.chatUserName,
    this.isOffline,
    this.isInvisible,
    this.actionTime,
    this.chatrealname,
    this.chatimage,
    this.lastMessage,
  });
}
