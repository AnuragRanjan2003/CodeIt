import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<Resource<Object>> addUser(User user) async {
    try {
      final res =
          await userCollection.doc(user.uid).set(user, SetOptions(merge: true));
      return Success('done');
    } on FirebaseException catch (e) {
      return Failure(e.message.toString());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Stream<DocumentSnapshot<User>> getUser(String uid)  => userCollection.doc(uid).snapshots();
}
