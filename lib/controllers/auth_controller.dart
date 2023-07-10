import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/components/snackbar.dart';
import 'package:codeit/models/user.dart';
import 'package:codeit/repo/auth_repo.dart';
import 'package:codeit/res/colors/colors.dart';
import 'package:codeit/utils/resource.dart';
import 'package:codeit/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final authRepo = Get.put(AuthRepo());
  Rxn<User> user = Rxn<User>();
  Rxn<String> authError = Rxn<String>();
  Rx<bool> loading = false.obs;
  StreamSubscription<DocumentSnapshot<User>>? sub;

  auth.User? get fUser => auth.FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    user.value = null;
    authError.value = null;
    Future.delayed(const Duration(seconds: 3), () {
      if (fUser != null) {
        startListeningToUser(fUser!.uid);
        Get.toNamed(Routes.main);
      }
    });
    super.onInit();
  }

  signUpUser(User u) {
    loading.value = true;
    if (!userValid(u)) {
      Get.snackbar('Failure', 'incomplete credentials',
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          backgroundColor: ProjectColors.backgroundColor);
    }
    authRepo.signUp(u).then((value) {
      if (value.isSuccess()) {
        user.value = (value as Success<User>).data;
        authError.value = null;
        loading.value = false;
        startListeningToUser(value.data.uid);
        Get.toNamed(Routes.main);
      } else {
        debugPrint((value as Failure).error);
        user.value = null;
        authError.value = (value as Failure).error;
        loading.value = false;
        Get.showSnackbar(AppSnackBar()
            .defaultSnackBar('Failure', authError.value!, 'Go back'));
      }
    });
  }

  bool userValid(User u) {
    if (user.value == null) return false;
    final json = user.value!.toJson();
    bool res = true;
    json.forEach((key, value) {
      if (key != 'uid' && value == null) res = false;
    });

    return res;
  }

  loginUser(String email, String password) {
    loading.value = true;
    authRepo.loginUser(email, password).then((value) {
      if (value.isSuccess()) {
        startListeningToUser((value as Success<User>).data.uid);
        Get.toNamed(Routes.main);
        loading.value = false;
      } else {
        loading.value = false;
        Get.showSnackbar(
          AppSnackBar()
              .defaultSnackBar('Failure', (value as Failure).error, null),
        );
      }
    });
  }

  startListeningToUser(String uid) {
    sub = authRepo.getUserStream(uid).listen((value) {
      if (value.data() != null) user.value = value.data()!;
    });
  }

  logOut(){
    authRepo.logOut().then((value) {
      if(sub!=null) sub!.cancel();
      user.value = null;
    });
  }

  @override
  void onClose() {
    if (sub != null) sub!.cancel();
    super.onClose();
  }
}
