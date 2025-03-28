import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Finished_Notes_Body.dart';

class FinishedNotes extends StatelessWidget {
  const FinishedNotes({super.key});
static String id='Finished';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FinishedNotesBody(),
    ));
  }
}
