import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'constants.dart';

void showFinishedDialog({required BuildContext context,required String title,required String subtitle,image}) {
  Dialogs.materialDialog(
    color: Colors.white,
    dialogWidth: 1,
    context: context,
    customView: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image),
        const SizedBox(height: 10),
         Text(title,style:const TextStyle(
           fontSize: 35,
           color: kprimary,
           fontWeight: FontWeight.bold,
         ),),
         Text(
         subtitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
void NormalDialoge({required BuildContext context,required String title,required String subtitle}) {
  Dialogs.materialDialog(
  color: Colors.white,
  msg: subtitle,
  msgStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  titleStyle: const TextStyle(
      color: kprimary,
      fontSize: 28,
      fontWeight: FontWeight.bold
  ),
  title: title,
  dialogWidth:1,
  context: context,
);
}
