import 'package:bloc/bloc.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';
part 'searchbloc_event.dart';
part 'searchbloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBlocBloc()
      : super(SearchResultState(studentList: DBFunction.getStudentList())) {
    on<SearchBlocEvent>(
      (event, emit) {
        if (event is InputEvent) {
          List<StudentDb> studentDatas = DBFunction.getStudentList()
              .where(
                (element) => element.name.toLowerCase().contains(
                      event.searchInput.toLowerCase(),
                    ),
              )
              .toList();
          emit(
            SearchResultState(studentList: studentDatas),
          );
        }
        if (event is ClearInputEvent) {
          emit(
            SearchResultState(
              studentList: DBFunction.getStudentList(),
            ),
          );
        }
      },
    );
  }
}
