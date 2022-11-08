part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchBlocEvent {
  const SearchBlocEvent();
}

class InputEvent extends SearchBlocEvent {
  final String searchInput;
  const InputEvent({required this.searchInput});
}

class ClearInputEvent extends SearchBlocEvent {}
