import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/Dialoge.dart';
import 'package:to_do/features/LogIn/presentation/Forget_Password.dart';
import 'package:to_do/features/LogIn/presentation/Google_SignIn.dart';
import 'package:to_do/features/LogIn/presentation/Sign_Up_Section.dart';
import 'package:to_do/core/Header.dart';
import '../../../core/button.dart';
import '../../../core/constants.dart';
import '../../../core/textfield.dart';
import '../../SignUp/AuthBloc/auth_bloc.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  late String email;
  late String password;
  GlobalKey<FormState>formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Header(title: 'Let\'s Login', subTitle: 'And notes your idea',),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    Textfield(
                      onchanged: (data) {
                        email = data;
                      }, title: 'Email Address',
                     ),
                    const SizedBox(height: 20,),

                    Textfield(
                      obsecure: true,
                      onchanged: (data) {
                        password = data;
                      }, title: 'Password',
                     ),

                    const SizedBox(height: 25,),
                    InkWell(
                        onTap: (){
                          NormalDialoge(context: context, title: 'Reset your password', subtitle: "A reset password email has been sent.");
                          BlocProvider.of<AuthBloc>(context).add(ForgetPasswordEvent(email: email));
                        },
                        child: ForgetPassword()
                    ),
                    const SizedBox(height: 40,),
                    button(ontap:() {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(LoginEvent(email: email, password: password));
                      }

                    },
                      label: 'Log In', color: kprimary, textcolor: ksecondary,height: 54,width: 350,),
                    const SizedBox(height:16 ,),
                    const Googlesignin(),
                    const SizedBox(height:16 ,),
                    const Signupsection(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
