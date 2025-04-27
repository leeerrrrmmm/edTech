// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_field.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonsFieldAdapter extends TypeAdapter<LessonsField> {
  @override
  final int typeId = 2;

  @override
  LessonsField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonsField(
      lessonFieldId: fields[0] as int,
      lessonFieldVideoPath: fields[1] as String,
      lessonFieldIntroduction: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LessonsField obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lessonFieldId)
      ..writeByte(1)
      ..write(obj.lessonFieldVideoPath)
      ..writeByte(2)
      ..write(obj.lessonFieldIntroduction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonsFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
