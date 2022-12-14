// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentDbAdapter extends TypeAdapter<StudentDb> {
  @override
  final int typeId = 0;

  @override
  StudentDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentDb(
      name: fields[0] as String,
      age: fields[1] as int,
      place: fields[2] as String,
      qualification: fields[4] as String,
      imagePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentDb obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.place)
      ..writeByte(3)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.qualification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
