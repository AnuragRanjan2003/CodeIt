import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/db/database.dart';
import 'package:codeit/utils/resource.dart';

import '../models/thread.dart';

class ThreadRepo {
  Future<Resource<Object>> addThread(Thread thread) async =>
      await Database().addThread(thread);

  Stream<QuerySnapshot<Thread>> getAllThread() => Database().getThreads();
}
