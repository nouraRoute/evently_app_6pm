import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app_6pm/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //login
  static Future<UserModel?> login(String email, String password) async {
    try {
      print('---EMAIL:$email---PASSWORD:$password');
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('${credential.user?.uid}');
      return await _getUserInfo(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print('ERROR--->${e.code}');
      throw e.message ?? "some thing went wrong";
    }
  }

  //register
  static register(String password, UserModel user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );
      String uid = credential.user!.uid;
      user.uid = uid;
      await _addUser(user);
    } on FirebaseAuthException catch (e) {
      print('ERROR--->${e.code}');
      throw e.message ?? "some thing went wrong";
    } catch (e) {
      rethrow;
    }
  }

  static CollectionReference<UserModel> _getUsersCollection() {
    CollectionReference<UserModel> users = FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
    return users;
  }

  static _addUser(UserModel user) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference doc = usersCollection.doc(user.uid);
    await doc.set(user);
  }

  static Future<UserModel?> _getUserInfo(String uid) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> doc = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> snapShot = await doc.get();
    return snapShot.data();
  }

  //crud
}
