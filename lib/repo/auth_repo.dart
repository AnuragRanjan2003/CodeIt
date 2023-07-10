import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/utils/resource.dart';
import 'package:get/get.dart';

import '../db/auth.dart';

class AuthRepo {
  final auth = Get.put(Auth());

  Future<Resource<User>> signUp(User user) async => await auth.signUpUser(user);

   Future<Resource<User>> loginUser(String email, String password) async =>
      await auth.loginUser(email, password);

   Future logOut() async => auth.logOut();

  Stream<DocumentSnapshot<User>> getUserStream(String uid) => auth.getUserStream(uid);
}
