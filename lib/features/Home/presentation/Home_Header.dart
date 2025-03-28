import 'package:flutter/cupertino.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
}
