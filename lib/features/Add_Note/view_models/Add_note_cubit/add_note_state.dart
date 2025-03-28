part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}
class AddNoteError extends AddNoteState {
  final String message;
  AddNoteError(this.message);
}