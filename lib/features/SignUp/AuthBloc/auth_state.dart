part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {}
final class LoginFailur extends AuthState {
  final String errormessage;
  LoginFailur({required this.errormessage});
}


final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {}
final class RegisterFailur extends AuthState {

  final String errormessage;
  RegisterFailur({required this.errormessage});

}

final class GoogleSignInSuccess extends AuthState {}
final class GoogleSignInFailure extends AuthState {
  final String errormessage;
  GoogleSignInFailure({required this.errormessage});
}

final class ForgetPasswordState extends AuthState {}
final class EmailVerification extends AuthState {}