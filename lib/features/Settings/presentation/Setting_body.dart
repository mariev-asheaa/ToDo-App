import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/features/Settings/presentation/Setting%20Header.dart';
import 'package:to_do/features/Settings/presentation/User_info.dart';


class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SettingHeader(),
     Expanded(child: UserInfo())
      ],
    );
  }
}
