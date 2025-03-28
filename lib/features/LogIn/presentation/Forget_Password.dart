import 'package:flutter/material.dart';
import '../../../core/constants.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key, });

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        const Text('forget password?',style: TextStyle(
            color: kprimary,
            fontSize: 15
        ),),
      ],
    );
  }
}
