import 'package:flutter/cupertino.dart';

class NoteModel{
   String title;
   String description;
   Color color;
  final String? image;
  final Color? textcolor;
  final int? categoryIndex;
  final String ?docId;
   NoteModel({required this.title,
     required this.description,
     required this.color,
     this.image,
     this.textcolor,
     this.categoryIndex,
     this.docId,
   });
}