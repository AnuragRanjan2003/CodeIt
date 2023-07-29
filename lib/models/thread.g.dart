// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thread _$ThreadFromJson(Map<String, dynamic> json) => Thread(
      json['title'] as String,
      json['discr'] as String,
      json['username'] as String,
      json['uid'] as String,
      json['id'] as String,
      DateTime.parse(json['date'] as String),
      json['domain'] as String,
    );

Map<String, dynamic> _$ThreadToJson(Thread instance) => <String, dynamic>{
      'title': instance.title,
      'discr': instance.discr,
      'username': instance.username,
      'domain': instance.domain,
      'uid': instance.uid,
      'id': instance.id,
      'date': instance.date.toIso8601String(),
    };
