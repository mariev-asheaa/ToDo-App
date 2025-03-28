import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/constants.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,color: kprimary,size: 15,),
                Text('Back',style: TextStyle(color: kprimary,fontSize: 14),)
              ],
            ),
          ),
          SizedBox(width: 100,),
          Text('Settings',style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}

