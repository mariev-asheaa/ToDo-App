import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import 'Note_Card.dart';
import '../models/Note_model.dart';

class AddNoteGrid extends StatelessWidget {
  const AddNoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return NoteCard(
            noteModel: noteTypes[index],
            index: index,
            );
        },
        childCount: noteTypes.length,
      ),
    );
  }

  static List<NoteModel> noteTypes = [
    NoteModel(
        title: "Interesting Idea",
        description: "Use free text area, feel free to write it all",
        color: Color(0xff6A3EA1),
        image: Assets.assetsFrame2,
        textcolor: Colors.white,
        categoryIndex: 0),
    NoteModel(
        title: "Goals",
        description: "Near/future goals, notes and keep focus",
        color: Color(0xffF8C715),
        image: Assets.assetsFrame3,
        textcolor: Color(0xff725A03),
        categoryIndex: 1
    ),
    NoteModel(
        title: "Guidance",
        description: "Create guidance for routine activities",
        color: Color(0xffCE3A54),
        image: Assets.assetsFrame4,
        textcolor: Colors.white,
        categoryIndex: 2
    ),
    NoteModel(
        title: "Buy Something",
        description: "Use checklist, so you won’t miss anything",
        color: Color(0xff1F7F40),
        image: Assets.assetsFrame5,
        textcolor: Colors.white,
        categoryIndex: 3
    ),
    NoteModel(
        title: "Routine Tasks",
        description: "Checklist with sub-checklist",
        color: Color(0xffDEDC52),
        image: Assets.assetsFrame6,
        textcolor: Color(0xff725A03),
        categoryIndex: 4
    ),
  ];
}
