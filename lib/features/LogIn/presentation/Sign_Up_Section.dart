import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../SignUp/presentation/Sign_Up.dart';

class Signupsection extends StatelessWidget {
  const Signupsection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(r'Don''t have an account?',style: TextStyle(
            color: kprimary,
            fontSize: 20
        ),),
        const SizedBox(width: 18,),
        GestureDetector(
          onTap: (){
          Navigator.pushNamed(context, SignUp.id);
          },
          child: const Text('Register here',style: TextStyle(
              color: kprimary,
              fontSize: 20
          ),),
        ),
      ],
    );
  }
}

