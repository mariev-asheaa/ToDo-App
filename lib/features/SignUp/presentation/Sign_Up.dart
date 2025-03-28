import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:to_do/core/Dialoge.dart';

import '../../../core/constants.dart';
import '../../Home/presentation/Home.dart';
import '../AuthBloc/auth_bloc.dart';
import 'SignUp_Body.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key,});

  static String id='SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is EmailVerification) {
            NormalDialoge(context: context, title: 'Verify Email', subtitle: 'A verification email has been sent. Please verify your email.');
          }
          else if (state is RegisterSuccess) {
            Navigator.pushReplacementNamed(context, Home.id);
          }
          else if(state is RegisterFailur){
            NormalDialoge(context: context, title: 'Error', subtitle: state.errormessage);
          }
        },
        builder: (context, state) {
          return const Scaffold(
              body: SafeArea(child: SignUpBody())
          );
        },
      ),
    );
  }
}

