import 'package:json_annotation/json_annotation.dart';
part 'result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)
class Result<T> {
  final int code;
  final String status;
  final String message;
  final T? data;

  Result({
    required this.code,
    required this.status,
    required this.message,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ResultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ResultToJson(this, toJsonT);

}