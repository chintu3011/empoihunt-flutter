// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_experience_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserExperienceModelAdapter extends TypeAdapter<UserExperienceModel> {
  @override
  final int typeId = 4;

  @override
  UserExperienceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserExperienceModel(
      id: fields[0] as int?,
      iUserId: fields[1] as int?,
      vDesignation: fields[2] as String?,
      vCompanyName: fields[3] as String?,
      vDuration: fields[4] as String?,
      vJobLocation: fields[5] as String?,
      bIsCurrentCompany: fields[6] as int?,
      tCreatedAt: fields[7] as String?,
      tUpadatedAt: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserExperienceModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.iUserId)
      ..writeByte(2)
      ..write(obj.vDesignation)
      ..writeByte(3)
      ..write(obj.vCompanyName)
      ..writeByte(4)
      ..write(obj.vDuration)
      ..writeByte(5)
      ..write(obj.vJobLocation)
      ..writeByte(6)
      ..write(obj.bIsCurrentCompany)
      ..writeByte(7)
      ..write(obj.tCreatedAt)
      ..writeByte(8)
      ..write(obj.tUpadatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserExperienceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
