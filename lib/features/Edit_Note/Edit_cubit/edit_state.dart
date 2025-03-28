part of 'edit_cubit.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}

final class EditSuccess extends EditState {}