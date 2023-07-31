import 'package:flutterx/app/core/util/type_converter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
@HiveType(typeId: 1)
class User {

  @HiveField(0)
  @JsonKey(fromJson: TypeConverter.intToString)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String avatar;
  @HiveField(3)
  final String email;

  User(this.id, this.name, this.avatar, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  
}