import 'package:flutter/cupertino.dart';

import '../../../core/constants.dart';
import '../../LogIn/presentation/Log_In.dart';

class LogInSection extends StatelessWidget {
  const LogInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?',style: TextStyle(
            color: kprimary,
            fontSize: 20
        ),),
        const SizedBox(width: 18,),
        GestureDetector(
          onTap: (){
          Navigator.pushNamed(context, Login.id);
          },
          child: const Text('Log in',style: TextStyle(
              color: kprimary,
              fontSize: 20
          ),),
        ),
      ],
    );
  }
}