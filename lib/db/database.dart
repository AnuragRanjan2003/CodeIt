import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/models/thread.dart';
import 'package:codeit/utils/resource.dart';

import '../models/user.dart';

class Database {
  final db = FirebaseFirestore.instance;
  final userCollection = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
        fromFirestore: (snapshot, options) => User.fromJson(snapshot.data()),
        toFirestore: (user, options) => user.toJson(),
      );

  final threadCollection = FirebaseFirestore.instance
      .collection('thread')
      .withConverter<Thread>(
          fromFirestore: (snapshot, options) =>
              Thread.fromJson(snapshot.data()),
          toFirestore: (thread, options) => thread.toJson());

  Future<Resource<Object>> addUser(User user) async {
    try {
      await userCollection.doc(user.uid).set(user, SetOptions(merge: true));
      return Success('done');
    } on FirebaseException catch (e) {
      return Failure(e.message.toString());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Stream<DocumentSnapshot<User>> getUser(String uid) =>
      userCollection.doc(uid).snapshots();

  Future<Resource<Object>> addThread(Thread th) async {
    try {
      await threadCollection.doc(th.id).set(th);
      return Success('done');
    } on FirebaseException catch (e) {
      return Failure(e.message.toString());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Stream<QuerySnapshot<Thread>> getThreads() => threadCollection.snapshots();
}
