import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../Home/presentation/Home.dart';
import '../../SignUp/AuthBloc/auth_bloc.dart';

class Googlesignin extends StatefulWidget {
  const Googlesignin({super.key});

  @override
  State<Googlesignin> createState() => _GooglesigninState();
}

class _GooglesigninState extends State<Googlesignin> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is GoogleSignInSuccess){
      Navigator.pushReplacementNamed(context, Home.id);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(GoogleSignInEvent());
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color:Color(0xffC8C5CB) ,thickness: 1,),
                  Text('Or',style: TextStyle( color:Color(0xffC8C5CB),),),
                  Divider(color:Color(0xffC8C5CB),thickness: 1,),
                ],
              ),
              SizedBox(height: 16,),
              Container(
                height: 54,
                width: 350,
                decoration: BoxDecoration(
                    color: ksecondary,
                    borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xffC8C5CB),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Logo Image.png'),

                    const Center(
                      child: Text('Log in with Google',
                        style: TextStyle(
                            fontSize: 22
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}