
import 'package:json_annotation/json_annotation.dart';

part 'thread.g.dart';

@JsonSerializable()
class Thread {
  final String title;
  final String discr;
  final String username;
  final String domain;
  final String uid;
  final String id;
  final DateTime date;

  Thread(this.title, this.discr, this.username, this.uid, this.id, this.date, this.domain);

  factory Thread.fromJson(json) => _$ThreadFromJson(json);

  Map<String,dynamic> toJson() => _$ThreadToJson(this);
}