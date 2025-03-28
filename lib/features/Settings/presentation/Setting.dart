import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/features/Settings/presentation/Setting_body.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});
static String id='Setting';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SettingBody(),
      ),
    );
  }
}
