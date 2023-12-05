// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGetDetailModelAdapter extends TypeAdapter<UserGetDetailModel> {
  @override
  final int typeId = 2;

  @override
  UserGetDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGetDetailModel(
      status: fields[0] as int,
      message: fields[1] as String,
      data: fields[2] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, UserGetDetailModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGetDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 3;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      tAuthToken: fields[0] as String,
      iUserId: fields[1] as int,
      tDeviceToken: fields[2] as String,
      user: fields[3] as User,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tAuthToken)
      ..writeByte(1)
      ..write(obj.iUserId)
      ..writeByte(2)
      ..write(obj.tDeviceToken)
      ..writeByte(3)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 4;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      vFirstName: fields[0] as String,
      vJobLocation: fields[1] as String,
      tResumeUrl: fields[2] as dynamic,
      vLastName: fields[3] as String,
      vDuration: fields[4] as dynamic,
      vWorkingMode: fields[5] as String,
      vMobile: fields[6] as String,
      vPreferCity: fields[7] as dynamic,
      tTagLine: fields[8] as String,
      vEmail: fields[9] as String,
      vPreferJobTitle: fields[10] as dynamic,
      isBlock: fields[11] as int,
      id: fields[12] as int,
      vCity: fields[13] as String,
      vQualification: fields[14] as String,
      isLogin: fields[15] as int,
      vFirebaseId: fields[16] as String,
      tBio: fields[17] as String,
      tProfileUrl: fields[18] as String,
      tCreatedAt: fields[19] as String,
      iRole: fields[20] as int,
      vCurrentCompany: fields[21] as String,
      tProfileBannerUrl: fields[22] as dynamic,
      tUpadatedAt: fields[23] as String,
      vDesignation: fields[24] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.vFirstName)
      ..writeByte(1)
      ..write(obj.vJobLocation)
      ..writeByte(2)
      ..write(obj.tResumeUrl)
      ..writeByte(3)
      ..write(obj.vLastName)
      ..writeByte(4)
      ..write(obj.vDuration)
      ..writeByte(5)
      ..write(obj.vWorkingMode)
      ..writeByte(6)
      ..write(obj.vMobile)
      ..writeByte(7)
      ..write(obj.vPreferCity)
      ..writeByte(8)
      ..write(obj.tTagLine)
      ..writeByte(9)
      ..write(obj.vEmail)
      ..writeByte(10)
      ..write(obj.vPreferJobTitle)
      ..writeByte(11)
      ..write(obj.isBlock)
      ..writeByte(12)
      ..write(obj.id)
      ..writeByte(13)
      ..write(obj.vCity)
      ..writeByte(14)
      ..write(obj.vQualification)
      ..writeByte(15)
      ..write(obj.isLogin)
      ..writeByte(16)
      ..write(obj.vFirebaseId)
      ..writeByte(17)
      ..write(obj.tBio)
      ..writeByte(18)
      ..write(obj.tProfileUrl)
      ..writeByte(19)
      ..write(obj.tCreatedAt)
      ..writeByte(20)
      ..write(obj.iRole)
      ..writeByte(21)
      ..write(obj.vCurrentCompany)
      ..writeByte(22)
      ..write(obj.tProfileBannerUrl)
      ..writeByte(23)
      ..write(obj.tUpadatedAt)
      ..writeByte(24)
      ..write(obj.vDesignation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
