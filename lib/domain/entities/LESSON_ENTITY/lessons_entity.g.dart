// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonsEntityAdapter extends TypeAdapter<LessonsEntity> {
  @override
  final int typeId = 1;

  @override
  LessonsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonsEntity(
      lessonName: fields[0] as String,
      lessonsFields: (fields[1] as List).cast<LessonsField>(),
    );
  }

  @override
  void write(BinaryWriter writer, LessonsEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lessonName)
      ..writeByte(1)
      ..write(obj.lessonsFields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
