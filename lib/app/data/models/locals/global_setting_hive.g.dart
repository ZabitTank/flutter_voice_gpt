// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_setting_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalSettingAdapter extends TypeAdapter<GlobalSetting> {
  @override
  final int typeId = 0;

  @override
  GlobalSetting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalSetting(
      isDark: fields[0] == null ? false : fields[0] as bool,
      isAutoRead: fields[1] == null ? false : fields[1] as bool,
      chatHistory:
          fields[2] == null ? [] : (fields[2] as List).cast<ChatModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GlobalSetting obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isDark)
      ..writeByte(1)
      ..write(obj.isAutoRead)
      ..writeByte(2)
      ..write(obj.chatHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalSettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
