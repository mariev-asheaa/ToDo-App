part of 'finished_notes_cubit.dart';

@immutable
sealed class FinishedNotesState {}

final class FinishedNotesInitial extends FinishedNotesState {}
class FetchFinishedNotesSuccess extends FinishedNotesState {
  final List<NoteModel> finishedNotes;
  FetchFinishedNotesSuccess(this.finishedNotes);
}
class FetchFinishedNotesLoading extends FinishedNotesState {}