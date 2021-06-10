import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:wuyiyit/models/user.dart';
import 'package:wuyiyit/models/message.dart';

class MainProvider extends ChangeNotifier {
  //User connection socket
  List<Socket> sockets = [];

  void addSocket(Socket socket) {
    sockets.add(socket);
    notifyListeners();
  }

  //Current User Information
  List<User> currentUser = [];

  void changeCurrentUser(User userModel) {
    currentUser = [];
    currentUser.add(userModel);
    notifyListeners();
  }

  //Online Users List
  List<User> allOnlineUsers = [];

  void updateAllOnlineUsers(List<User> usersList) {
    allOnlineUsers = usersList;
    notifyListeners();
  }

  void addNewOnlineUser(User userModel) {
    allOnlineUsers.add(userModel);
    notifyListeners();
  }

  void removeOnlineUser(User userModel) {
    allOnlineUsers.remove(userModel);
    notifyListeners();
  }

  //Chatting Users Related
  List<User> chattingUsers = [];

  void addUserToChattingUsersList(User newUser) {
    chattingUsers.add(newUser);
    notifyListeners();
  }

  //Conversation Related
  Map<User, List<Message>> conversationList = {};

  void addUserToConversationList(User userModel) {
    conversationList[userModel] = [];
    notifyListeners();
  }

  void addNewMessageToConversation(User userModel, Message message) {
    conversationList[userModel]!.add(message);
    notifyListeners();
  }
}
