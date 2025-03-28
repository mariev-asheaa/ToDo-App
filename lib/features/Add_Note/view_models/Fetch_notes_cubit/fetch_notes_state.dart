part of 'fetch_notes_cubit.dart';

@immutable
sealed class FetchNotesState {}

final class FetchNotesInitial extends FetchNotesState {}

class FetchSuccess extends FetchNotesState {
  final List<NoteModel> notes;
  FetchSuccess({required this.notes});
}

class FetchLoading extends FetchNotesState {}