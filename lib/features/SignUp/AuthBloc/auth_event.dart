part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class LoginEvent extends AuthEvent{
  final String email;
  final String password;
  LoginEvent({required this.email,required this.password});
}

class RegisterEvent extends AuthEvent{
  final String email;
  final String password;
  final String name;
  RegisterEvent({required this.email,required this.password,required this.name,});

}
class GoogleSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class ForgetPasswordEvent extends AuthEvent {
  final String email;
  ForgetPasswordEvent({required this.email});
}