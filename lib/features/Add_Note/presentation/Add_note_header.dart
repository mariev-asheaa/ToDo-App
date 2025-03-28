import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class AddNoteHeader extends StatelessWidget {
  const AddNoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6,top: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,color: kprimary,size: 10,),
                      Text('Home',style: TextStyle(color: kprimary,fontSize: 14),),
                    ],
                  ),
                ),
                SizedBox(width: 115,),
                Text('New Note',style: TextStyle(fontSize: 20),),
              ],
            ),

        ),
        Text('What Do You Want to Note?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),

      ],
    );
  }
}
