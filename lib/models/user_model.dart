import 'package:evently_app_6pm/models/event_model.dart';

class UserModel {
  String name;
  String email;
  String? uid;
  List<EventModel>? favEvent;
  UserModel({required this.email, required this.name, this.uid, this.favEvent});

  Map<String, dynamic> toJson() {
    return {'name': name, 'uid': uid, 'email': email};
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      uid: json['uid'],
    );
  }
}
