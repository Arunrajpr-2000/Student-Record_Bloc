import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_database_bloc/constants/constants.dart';
import 'package:student_database_bloc/db/model/student_db.dart';

class DBFunction {
  static Box<StudentDb> getBox() {
    return box;
  }

  static List<StudentDb> getStudentList() {
    final List<StudentDb> studentList = box.values.toList();
    return studentList;
  }

  static void addStudent(StudentDb student) {
    box.add(student);
  }

  static StudentDb getStudent(int key) {
    StudentDb student = box.get(key)!;
    return student;
  }

  static int updatestudent(StudentDb student, int key) {
    box.put(key, student);
    return key;
  }

  static int deletestudent(int key) {
    box.delete(key);
    return key;
  }
}
