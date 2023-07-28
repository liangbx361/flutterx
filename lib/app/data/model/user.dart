import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class User {

  final String id;
  final String name;
  final String avatar;
  final String email;

  User(this.id, this.name, this.avatar, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  
}