// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizEntityAdapter extends TypeAdapter<QuizEntity> {
  @override
  final int typeId = 3;

  @override
  QuizEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizEntity(
      quizNum: fields[0] as String,
      quizTitle: fields[1] as String,
      littleDescription: fields[2] as String,
      questions: (fields[3] as List).cast<Question>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.quizNum)
      ..writeByte(1)
      ..write(obj.quizTitle)
      ..writeByte(2)
      ..write(obj.littleDescription)
      ..writeByte(3)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
