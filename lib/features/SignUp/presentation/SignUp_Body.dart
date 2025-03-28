import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Header.dart';
import '../../../core/button.dart';
import '../../../core/constants.dart';
import '../../../core/textfield.dart';
import '../AuthBloc/auth_bloc.dart';
import 'Log_In_Section.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late String email;
  late String password;
  late String name;
  GlobalKey<FormState>formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Header(title: 'Register', subTitle: 'And start taking notes'),
                Column(
                  children: [
                    const SizedBox(height: 40,),
                    Textfield(
                      onchanged: (data){
                        name=data;
                      }, title: 'Full Name',
                    ),
                    const SizedBox(height: 20,),
                
                    Textfield(
                      onchanged: (data) {
                        email = data;
                      }, title: 'Email Address',
                    ),
                    const SizedBox(height: 20,),
                
                    Textfield(
                      onchanged: (data) {
                        password = data;
                      },
                      obsecure: true, title: 'Password',
                    ),
                    const SizedBox(height: 45,),
                
                    Textfield(
                      onchanged: (data) {
                        password = data;
                      },
                      obsecure: true, title: 'Retype Password',
                    ),
                
                    const SizedBox(height: 45,),
                    button(ontap:()async{
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(RegisterEvent(email: email, password: password, name: name,));
                
                      }},
                      label: 'Register', color: kprimary, textcolor: ksecondary,height: 54,width: 350,),
                
                    const SizedBox(height: 25,),
                    const LogInSection(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}