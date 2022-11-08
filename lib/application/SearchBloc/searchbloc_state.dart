part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchBlocState {
  const SearchBlocState();
}

class SearchResultState extends SearchBlocState {
  final List<StudentDb> studentList;
  const SearchResultState({required this.studentList});
}
