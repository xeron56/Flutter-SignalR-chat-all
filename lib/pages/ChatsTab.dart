import 'dart:convert';

import 'package:chat_app/models/chatlistModel.dart';
import 'package:chat_app/models/meconnectedModel.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:chat_app/models/newuserconnectedModel.dart';
import 'package:chat_app/utils/appTheme.dart';

import 'package:chat_app/utils/removeMessageExtraChar.dart';
//import 'package:chat_app/widgets/chatMessageListWidget.dart';
//import 'package:chat_app/widgets/chatTypeMessageWidget.dart';
import 'package:flutter/material.dart';
//import 'package:chat_app/models/ChatListItem.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:signalr_core/signalr_core.dart';
//import 'package:flutter/material.dart';
//import 'package:chat_app/screens/ChatScreen.dart';

class ChatsTab extends StatefulWidget {
  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  @override
  void initState() {
    super.initState();
    openSignalRConnection();
  }

  bool isMeOffline = false;
  bool isMeInvisible = false;

  ScrollController chatListScrollController = new ScrollController();
  TextEditingController messageTextController = TextEditingController();

  String currentUserId = '';
  // String UserName =
  //     "5814271d-8f57-4ea9-b693-7ae3fbb48688_26334db9-d878-4cc3-b9f2-226b6966c213.jpg_male_Riyazul Islam_51_5ft 7in_Muslim_Bachelors_UnMarried_approved";

  String UserName =
      'e37b5e8d-a71f-471d-9785-5b72db57cca6_no-photo-female.jpg_female_Mahmuda Akhtar_26_5ft 3in_Muslim_Bachelors_UnMarried_approved';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: chatListModel.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text(chatListModel[i].chatrealname!),
                    subtitle: Text(chatListModel[i].lastMessage!),
                    // trailing: Text(chatListModel[i].actionTime!),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          NetworkImage(chatListModel[i].chatimage!),
                    ),
                    onTap: () => showBarModalBottomSheet(
                        context: context,
                        builder: (context) => StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return Scaffold(
                                backgroundColor: Colors.white,
                                appBar: AppBar(
                                  title: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            chatListModel[i].chatimage!),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                chatListModel[i].chatrealname!,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "last seen today at 12:22",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.videocam,
                                        color: Colors.white,
                                      ),
                                      onPressed: null,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      onPressed: null,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                      onPressed: null,
                                    )
                                  ],
                                ),
                                body: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      // chatAppbarWidget(size, context),
                                      // chatMessageWidget(
                                      //   chatListScrollController,
                                      //   messageModel,
                                      //   currentUserId,
                                      // ), // This will print out all the messages from the server In the app chat list
                                      // chatTypeMessageWidget(
                                      //     messageTextController,
                                      //     submitMessageFunction,
                                      //     chatListModel[i].connectionId!),
                                      Expanded(
                                          child: Container(
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          controller: chatListScrollController,
                                          child: Column(
                                            children: [
                                              ...messageModel.map((e) =>
                                                  chatItemWidget(
                                                      e, currentUserId)),
                                              SizedBox(
                                                height: 6,
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minHeight: 60,
                                          maxHeight: 120.0,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 20,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0,
                                                          left: 0,
                                                          right: 0),
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minHeight: 60,
                                                      maxHeight: 120.0,
                                                    ),
                                                    child: TextField(
                                                      controller:
                                                          messageTextController,
                                                      scrollPhysics:
                                                          BouncingScrollPhysics(),
                                                      maxLines: null,
                                                      style: TextStyle(
                                                          color: AppTheme
                                                              .gradientColorFrom),
                                                      decoration:
                                                          InputDecoration(
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        filled: false,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        hintText:
                                                            "Type a message",
                                                        hintStyle: TextStyle(
                                                          color: AppTheme
                                                              .gradientColorTo
                                                              .withOpacity(.4),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.fromLTRB(
                                                                16, 16, 32, 16),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    submitMessageFunction(
                                                        chatListModel[i]
                                                            .connectionId!),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 12),
                                                  child: Icon(
                                                    Icons.send,
                                                    color: AppTheme
                                                        .gradientColorFrom,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  );
                },
                separatorBuilder: (ctx, i) {
                  return Divider();
                },
                itemCount: chatListModel.length,
              ));
  }

// ChatPage(chatListModel[i], currentUserId)
  //set url and configs
  final connection = HubConnectionBuilder()
      .withUrl(
          'https://chathub.bdmarriage.com/chatHub',
          HttpConnectionOptions(
            logging: (level, message) => print(message),
          ))
      .build();

  //connect to signalR
  //https://chathub.bdmarriage.com/chatHub
  //http://192.168.1.3:5000/chatHub
  Future<void> openSignalRConnection() async {
    await connection.start();

    connection.on('ReceiveMessage', (message) {
      _handleIncommingDriverLocation(message);
    });

    connection.on('MeConnected', (message) {
      _handleMeConnected(message);
    });
    connection.on('NewUserConnected', (message) {
      _handleNewUserConnected(message);
    });

    //Calling join user function in the server

    await connection
        .invoke('OnConnect', args: [UserName, isMeOffline, isMeInvisible]);
  }

  List<MessageModel> messageModel = [];
  List<ChatListModel> chatListModel = [];

  List<MeconnectedModel> meconnectedModel = [];
  List<NewuserConnectedModel> newuserConnectedModel = [];

  nthIndex(str, pat, n) {
    var L = str.length, i = -1;
    while (n-- & i++ < L) {
      i = str.indexOf(pat, i);
      if (i < 0) break;
    }
    return i;
  }
//return name.split(/\s+/).slice(0, 2).join(" "); //

  getShortName(userName) {
    // var startPos = nthIndex(userName, '_', 3);
    // var endPos = nthIndex(userName, '_', 4) - 1;
    // var nameLength = endPos - startPos;

    // var name = userName.substring(startPos + 1, nameLength);

    int startIndex = userName.indexOf(RegExp(r'_'),
        userName.indexOf(RegExp(r'_'), userName.indexOf(RegExp(r'_')) + 1) + 1);
    int endIndex = userName.indexOf(
        RegExp(r'_'),
        userName.indexOf(
                RegExp(r'_'),
                userName.indexOf(
                        RegExp(r'_'), userName.indexOf(RegExp(r'_')) + 1) +
                    1) +
            1);

    //find substring
    String name = userName.substring(startIndex + 1, endIndex);
    //Return first 2 words from string

    return name;
  }

  // find starting index and end index of the string
  indexfind() {
    var name =
        'e37b5e8d-a71f-471d-9785-5b72db57cca6_no-photo-female.jpg_female_Mahmuda Akhtar_26_5ft 3in_Muslim_Bachelors_UnMarried_approved';
//print(string.indexOf('art'));                     // 1
//print(string.indexOf(RegExp(r'[A-Z][a-z]'))); // 0
    print(name.indexOf(RegExp(r'_')));
    print(name.indexOf(RegExp(r'_'), name.indexOf(RegExp(r'_')) + 1));
    print(name.indexOf(RegExp(r'_'), name.indexOf(RegExp(r'_')) + 1));
    //print index of third _ in the string
    print(name.indexOf(RegExp(r'_'),
        name.indexOf(RegExp(r'_'), name.indexOf(RegExp(r'_')) + 1) + 1));
    //print index of fourth _ in the string
    print(name.indexOf(
        RegExp(r'_'),
        name.indexOf(
                RegExp(r'_'),
                name.indexOf(RegExp(r'_'), name.indexOf(RegExp(r'_')) + 1) +
                    1) +
            1));
    //print index of fifth _ in the string
    print(name.indexOf(
        RegExp(r'_'),
        name.indexOf(
                RegExp(r'_'),
                name.indexOf(
                        RegExp(r'_'),
                        name.indexOf(
                                RegExp(r'_'), name.indexOf(RegExp(r'_')) + 1) +
                            1) +
                    1) +
            1));
  }

  getUserIcon(userName) {
    // var startPos = nthIndex(userName, '_', 1) + 1;
    // var endPos = nthIndex(userName, '_', 2);
    // var length = endPos - startPos;
    // var photoName = userName.substr(startPos, length);

    int startIndex = userName.indexOf(RegExp(r'_'));
    int endIndex =
        userName.indexOf(RegExp(r'_'), userName.indexOf(RegExp(r'_')) + 1);

    //find substring
    String photoName = userName.substring(startIndex + 1, endIndex);

    var url = 'https://www.bdmarriage.com';
    var icon = url + '/Photos/Members/s25634/' + photoName;
    return icon;
  }

  getUserId(chatUserName) {
    var userId = '';
    if (chatUserName) {
      userId = chatUserName.substr(0, chatUserName.indexOf("_"));
    }

    return userId;
  }

  Future<void> _handleMeConnected(List<dynamic>? args) async {
    var sondata = jsonEncode(args);
    currentUserId = args![0];
    print('currentuser==' + currentUserId);

    // print(sondata);
    // print(args); // TODO :-  START FROM HERE TOMORROW
    // print how many map in args[0] list
    print(args[1].length);
    if (args[1].isNotEmpty) {
      for (var i = 0; i < args[1].length; i++) {
        meconnectedModel
            .add(MeconnectedModel.fromJson(json.encode(args[1][i])));
        var sname = getShortName(meconnectedModel[i].chatUserName);
        var icon = getUserIcon(meconnectedModel[i].chatUserName);

        // var userId = getUserId(meconnectedModel[i].chatUserName);

        chatListModel.add(ChatListModel(
          connectionId: meconnectedModel[i].connectionId,
          userId: meconnectedModel[i].userId,
          chatUserName: meconnectedModel[i].chatUserName,
          isOffline: meconnectedModel[i].isOffline,
          isInvisible: meconnectedModel[i].isInvisible,
          actionTime: meconnectedModel[i].actionTime,
          chatrealname: sname,
          chatimage: icon,
          lastMessage: '',
        ));
      }

      setState(() {
        chatListModel = chatListModel;
      });
    }
    if (args[1].isEmpty) {
      print("no one in chat right now");
    }
  }

  Future<void> _handleIncommingDriverLocation(List<dynamic>? args) async {
    print('incomming driver location===============' + args![3].toString());
    //print(args![3]);

    if (args != null) {
      var fname = getShortName(args[1]);
      var tname = getShortName(args[2]);
      var icon = getUserIcon(args[1]);
      setState(() {
        messageModel.add(MessageModel(
          connectionId: args[0],
          fromUserName: fname,
          toUserName: tname,
          message: args[3],
          isMe: args[4],
          fromUserImage: icon,
        ));
      });
    }
  }

  Future<void> _handleNewUserConnected(List<dynamic>? args) async {
    if (args!.isNotEmpty) {
      var jsonResponse = json.encode(args);
      print(jsonResponse);
    }

    // make set state an dupdate the listview with new data
  }

  submitMessageFunction(String conid) async {
    //  var messageText = removeMessageExtraChar(messageTextController.text);
    String editedUserText = messageTextController.text;
    for (;;) {
      if (editedUserText.endsWith('\n')) {
        editedUserText = editedUserText.substring(editedUserText.length - 1);
      } else if (editedUserText.endsWith(' ')) {
        editedUserText = editedUserText.substring(editedUserText.length - 1);
      } else if (editedUserText.startsWith(' ')) {
        editedUserText = editedUserText.substring(1);
      } else
        break;
    }
    await connection.invoke('SendMessage', args: [conid, editedUserText]);
    messageTextController.text = "";

    Future.delayed(const Duration(milliseconds: 100), () {
      chatListScrollController.animateTo(
          chatListScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
    });
  }
}

// Widget chatMessageWidget(ScrollController chatListScrollController,
//     List<MessageModel> messageModel, String currentUserId) {
//   return Expanded(
//       child: Container(
//     color: Colors.white,
//     child: SingleChildScrollView(
//       controller: chatListScrollController,
//       child: Column(
//         children: [
//           ...messageModel.map((e) => chatItemWidget(e, currentUserId)),
//           SizedBox(
//             height: 6,
//           )
//         ],
//       ),
//     ),
//   ));
// }

Widget chatItemWidget(MessageModel e, String currentUserId) {
  bool isMyChat = e.isMe!;
  // make ismychat always opposite of isMe
  // assert(!isMyChat);
  print(isMyChat);

  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isMyChat
            ? messageTime(isMyChat, e)
            : userAvatar(e.connectionId!, e.fromUserName!, e.fromUserImage!),
        isMyChat
            ? messageTextAndName(isMyChat, e.message!, e.toUserName!)
            : messageTextAndName(isMyChat, e.message!, e.fromUserName!),
        //messageTextAndName(isMyChat, e.message!, e.userName!),
        if (!isMyChat) messageTime(isMyChat, e)
      ],
    ),
  );
}

Widget systemMessageWidget(String text) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    margin: EdgeInsets.only(top: 8),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(Radius.circular(25))),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    ),
  );
}

Widget userAvatar(String userId, String userName, String userImageUrl) {
  Color avatarColor = Colors.greenAccent;
  // if (userId < 10000) {
  //   avatarColor = Color(0xFFffadad);
  // } else if (userId < 100000) {
  //   avatarColor = Color(0xFFffd6a5);
  // } else if (userId < 200000) {
  //   avatarColor = Color(0xFFfdffb6);
  // } else if (userId < 700000) {
  //   avatarColor = Color(0xFFcaffbf);
  // } else if (userId < 1000000) {
  //   avatarColor = Colors.blueAccent;
  // }

  return Container(
    width: 40,
    height: 40,
    margin: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(shape: BoxShape.circle, color: avatarColor),
    child: Center(
      child:
          //  Text(
          //   userName.substring(0, 1).toUpperCase(),
          //   style: TextStyle(
          //       fontFamily: AppTheme.secondFontName,
          //       fontSize: 18,
          //       color: Colors.black87),
          // ),
          // add network image

          //add circular network image
          CircleAvatar(
        backgroundImage: NetworkImage(userImageUrl),
        radius: 20,
      ),
    ),
  );
}

Widget messageTextAndName(bool isMyChat, String messageText, String userName) {
  return Expanded(
      child: Column(
    crossAxisAlignment:
        isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(isMyChat ? 20 : 8, 6, 8, 6),
        padding: EdgeInsets.fromLTRB(16, isMyChat ? 6 : 14, 16, 12),
        decoration: BoxDecoration(
            color: isMyChat ? Color(0xffebebeb0) : Color(0xffedf4ff),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMyChat)
              Text(
                userName,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            Text(
              messageText,
              style: TextStyle(height: 1.7),
            ),
          ],
        ),
      ),
    ],
  ));
}

Widget messageTime(bool isMyChat, MessageModel e) {
  // var parsedDate = DateTime.parse(e.createDate!);
  // var timeText = parsedDate.hour.toString() +
  //     " : " +
  //     parsedDate.minute.toString().padLeft(2, '0');
  //get current time in flutter

  var timeText = '9am';
  return Container(
      margin: EdgeInsets.only(
          left: isMyChat ? 48 : 8, bottom: 12, right: isMyChat ? 0 : 16),
      alignment: Alignment.center,
      child: Text(
        timeText,
        style: TextStyle(color: Colors.grey),
      ));
}
