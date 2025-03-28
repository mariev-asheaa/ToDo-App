import 'package:flutter/cupertino.dart';
import 'package:to_do/features/Add_Note/models/Note_model.dart';

import '../../Home/presentation/Note.dart';


class FinishedNotesGrid extends StatefulWidget {
  const FinishedNotesGrid({super.key, required this.finishedNotes});
  final List<NoteModel> finishedNotes;
  @override
  State<FinishedNotesGrid> createState() => _FinishedNotesGridState();
}

class _FinishedNotesGridState extends State<FinishedNotesGrid> {
  bool isActive = false;

  void onActiveStateChanged(bool active) {
    setState(() {
      isActive = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
         itemCount: widget.finishedNotes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:.7,
          ),
          itemBuilder: (context, index) {
            return Note(
              noteModel: widget.finishedNotes[index],
              onActiveStateChanged: onActiveStateChanged,
              docId: widget.finishedNotes[index].docId??'',
            );
          },
        ),
      ),
    );
  }
}
