import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeit/db/database.dart';
import 'package:codeit/models/user.dart' as user;
import 'package:codeit/utils/resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  final _mAuth = FirebaseAuth.instance;
  final Database _database = Get.put(Database());

  Future<Resource<user.User>> signUpUser(user.User u) async {
    try {
      final res = await _mAuth.createUserWithEmailAndPassword(
          email: u.email, password: u.password);
      if (res.user != null) {
        final newUser = user.User(u.name, u.email, u.password, u.cfHandle,
            u.gitHandle, res.user!.uid);
        final result = await _database.addUser(newUser);
        if (result.isSuccess()) {
          return Success<user.User>(newUser);
        } else {
          return Failure<user.User>((result as Failure).error);
        }
      } else {
        return Failure<user.User>(res.user.toString());
      }
    } on FirebaseAuthException catch (e) {
      return Failure<user.User>(e.message.toString());
    } on FirebaseException catch (e) {
      return Failure<user.User>(e.message.toString());
    } catch (e) {
      return Failure<user.User>(e.toString());
    }
  }

  Future<Resource<user.User>> addHandles(
      String cfHandle, String gitHandle) async {
    try {
      final newUser = user.User('', '', '', cfHandle, gitHandle, '');
      final res = await _database.addUser(newUser);
      if (res.isSuccess()) {
        return Success<user.User>(newUser);
      } else {
        return Failure<user.User>((res as Failure).error);
      }
    } on FirebaseException catch (e) {
      return Failure<user.User>(e.message.toString());
    } catch (e) {
      return Failure<user.User>(e.toString());
    }
  }

   Future<Resource<user.User>> loginUser(String email , String password) async {
    try{
      final res = await _mAuth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user==null) return Failure<user.User>('something went wrong');
      return Success<user.User>(user.User.fromCredentials(res.user!));
    } on FirebaseAuthException catch(e){
      return Failure<user.User>(e.message.toString());
    }on FirebaseException catch(e){
      return Failure<user.User>(e.message.toString());
    } catch(e){
      return Failure<user.User>(e.toString());
    }

  }

  logOut() async {
     await _mAuth.signOut();
  }

  Stream<DocumentSnapshot<user.User>> getUserStream(String uid) =>  _database.getUser(uid);

}
