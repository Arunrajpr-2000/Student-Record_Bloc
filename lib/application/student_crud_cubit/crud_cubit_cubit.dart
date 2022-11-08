import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:student_database_bloc/application/SearchBloc/searchbloc_bloc.dart';
import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';

part 'crud_cubit_state.dart';

class CrudCubitCubit extends Cubit<CrudCubitState> {
  final List<StudentDb> list;
  late StreamSubscription streamSubscription;
  final SearchBlocBloc searchBloc;

  CrudCubitCubit({required this.list, required this.searchBloc})
      : super(CrudCubitInitial()) {
    emit(AllstudentState(studentsList: list));
    streamSubscription = searchBloc.stream.listen((state) {
      if (state is SearchResultState) {
        if (state.studentList.isNotEmpty) {
          studentslistUpdate(state.studentList);
        } else {
          emit(NoResultState());
        }
      }
    });
  }

  void studentslistUpdate(List<StudentDb> list) {
    emit(AllstudentState(studentsList: list));
  }

  void addStudentListUpdate(Box<StudentDb> box, StudentDb student) {
    DBFunction.addStudent(student);
    emit(AllstudentState(studentsList: box.values.toList()));
  }

  void editStudentListUpdate(Box<StudentDb> box, StudentDb student, int key) {
    DBFunction.updatestudent(student, key);
    emit(AllstudentState(studentsList: box.values.toList()));
  }

  void deleteStudentListUpdate(Box<StudentDb> box, int key) {
    DBFunction.deletestudent(key);
    emit(AllstudentState(studentsList: box.values.toList()));
  }
}
