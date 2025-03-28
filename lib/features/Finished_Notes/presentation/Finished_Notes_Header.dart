import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class FinishedNotesHeader extends StatelessWidget {
  const FinishedNotesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children:[
          Image.asset(
            Assets.assetsHeader,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                child: Icon(Icons.arrow_back_ios,color: Colors.white,),
              ))
        ]
    );
  }
}
