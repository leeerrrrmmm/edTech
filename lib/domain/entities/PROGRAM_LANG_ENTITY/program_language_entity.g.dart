// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_language_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramLanguageEntityAdapter extends TypeAdapter<ProgramLanguageEntity> {
  @override
  final int typeId = 0;

  @override
  ProgramLanguageEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgramLanguageEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[3] as String,
      imgPath: fields[4] as String,
      courseTime: fields[5] as String,
      aboutTheCourse: fields[2] as String,
      price: fields[6] as int,
      lessons: (fields[7] as List).cast<LessonsEntity>(),
      quizes: (fields[8] as List).cast<QuizEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProgramLanguageEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.aboutTheCourse)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imgPath)
      ..writeByte(5)
      ..write(obj.courseTime)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.lessons)
      ..writeByte(8)
      ..write(obj.quizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramLanguageEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
