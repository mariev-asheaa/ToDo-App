
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/constants.dart';

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.isactive,required this.color});

  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive? CircleAvatar(
      radius: 17,
      backgroundColor: darkgrey,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
      ),
    ):  CircleAvatar(
      radius: 15,
      backgroundColor: color,
    );

  }
}