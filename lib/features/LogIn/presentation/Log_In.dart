import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/dialogs.dart';

import '../../../core/Dialoge.dart';
import '../../../core/constants.dart';
import '../../Home/presentation/Home.dart';
import '../../SignUp/AuthBloc/auth_bloc.dart';
import 'Log_In_Body.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id='login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context,Home.id);
          }
          else if(state is LoginFailur){
            NormalDialoge(context: context, title: 'Error', subtitle: state.errormessage);
          }
        },
        builder: (context, state) {
          return const Scaffold(
              body:LogInBody()
          );
        },
      ),
    );
  }
}

