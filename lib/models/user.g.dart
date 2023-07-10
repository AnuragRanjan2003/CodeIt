// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      json['email'] as String,
      json['password'] as String,
      json['cfHandle'] as String,
      json['gitHandle'] as String,
      json['uid'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'uid': instance.uid,
      'password': instance.password,
      'cfHandle': instance.cfHandle,
      'gitHandle': instance.gitHandle,
    };
