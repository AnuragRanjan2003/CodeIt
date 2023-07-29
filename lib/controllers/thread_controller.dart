import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/repo/thread_repo.dart';
import 'package:get/get.dart';

import '../models/thread.dart';
import '../utils/resource.dart';

class ThreadController extends GetxController {
  RxList<Thread> list = <Thread>[].obs;
  Rxn<String> error = Rxn<String>();
  final ThreadRepo _repo = ThreadRepo();
  Rx<String> domain = "".obs;
  StreamSubscription<QuerySnapshot<Thread>>? sub;

  Rx<bool> postOk = false.obs;

  @override
  void onInit() {
    sub = _repo.getAllThread().listen((event) {

      if (event.docs.isNotEmpty) {
        final List<Thread> res = [];
        for (var element in event.docs) {
          res.add(element.data());
        }
        list.value = res;
      }
    });
    super.onInit();
  }

  addThread(Thread thread) {
    postOk.value = false;
    _repo.addThread(thread).then((value) {
      if (value.isSuccess()) {
        postOk.value = false;
        error.value = null;
      } else {
        postOk.value = false;
        error.value = (value as Failure<Object>).error;
      }
    });
  }



  @override
  void onClose() {
    sub?.cancel();
    super.onClose();
  }
}
