import 'package:flutter/foundation.dart';
import 'package:wuyiyit/models/user.dart';
import 'package:wuyiyit/models/message.dart';

class MainProvider extends ChangeNotifier {
  List<User> currentUser = [];

  void changeCurrentUser(User userModel) {
    currentUser = [];
    currentUser.add(userModel);
    notifyListeners();
  }

  //Online Users List
  List<User> allUsers = [];

  void updateAllUsers(List<User> usersList) {
    allUsers = usersList;
    notifyListeners();
  }

  //Chatting Users List
  List<User> chattingUsers = [];

  void addUserToChattingUsersList(User newUser) {
    chattingUsers.add(newUser);
    notifyListeners();
  }

  //Conversation List
  Map<User, List<Message>> conversationList = {};

  void addUserToConversationList(User userModel) {
    conversationList[userModel] = [];
    notifyListeners();
  }
}
