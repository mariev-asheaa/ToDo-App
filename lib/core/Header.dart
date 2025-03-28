import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.subTitle});
final String title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        Text(
          subTitle,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
