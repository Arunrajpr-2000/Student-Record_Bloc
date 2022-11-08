import 'package:hive/hive.dart';

part 'student_db.g.dart';

@HiveType(typeId: 0)
class StudentDb extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final String place;

  @HiveField(3)
  final String? imagePath;

  @HiveField(4)
  final String qualification;

  StudentDb({
    required this.name,
    required this.age,
    required this.place,
    required this.qualification,
    this.imagePath,
  });
}
