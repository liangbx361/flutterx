// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLmAdapter extends TypeAdapter<UserLm> {
  @override
  final int typeId = 0;

  @override
  UserLm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLm(
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserLm obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
