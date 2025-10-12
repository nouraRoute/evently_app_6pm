import 'package:evently_app_6pm/models/user_model.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  setUser(UserModel user) {
    userModel = user;
    notifyListeners();
  }
}
