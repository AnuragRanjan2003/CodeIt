import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String uid;
  final String password;
  final String cfHandle;
  final String gitHandle;

  User(this.name, this.email, this.password, this.cfHandle, this.gitHandle, this.uid);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(json) => _$UserFromJson(json);

  factory User.fromCredentials(auth.User u) => User('',u.email!,'','','',u.uid);

  @override
  String toString() {
    return 'User(email : $email , name : $name , pass : $password , cf : $cfHandle , git : $gitHandle,uid $uid)';
  }
}
