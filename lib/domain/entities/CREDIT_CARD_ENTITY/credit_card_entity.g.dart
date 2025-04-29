// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardEntityAdapter extends TypeAdapter<CreditCardEntity> {
  @override
  final int typeId = 5;

  @override
  CreditCardEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCardEntity(
      id: fields[0] as int,
      cardHolderName: fields[1] as String,
      cardNum: fields[2] as String,
      validFrom: fields[3] as String,
      validThro: fields[4] as String,
      cvv: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cardHolderName)
      ..writeByte(2)
      ..write(obj.cardNum)
      ..writeByte(3)
      ..write(obj.validFrom)
      ..writeByte(4)
      ..write(obj.validThro)
      ..writeByte(5)
      ..write(obj.cvv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
