import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class User {
  final int id;

  User({
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
