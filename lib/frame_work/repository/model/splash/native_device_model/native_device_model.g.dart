// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_device_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NativeDeviceDetailModelAdapter
    extends TypeAdapter<NativeDeviceDetailModel> {
  @override
  final int typeId = 1;

  @override
  NativeDeviceDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NativeDeviceDetailModel(
      deviceId: fields[0] as String,
      deviceName: fields[2] as String,
      deviceVersion: fields[1] as String,
      deviceType: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NativeDeviceDetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.deviceId)
      ..writeByte(1)
      ..write(obj.deviceVersion)
      ..writeByte(2)
      ..write(obj.deviceName)
      ..writeByte(3)
      ..write(obj.deviceType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NativeDeviceDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
