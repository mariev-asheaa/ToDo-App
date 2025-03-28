import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/features/Add_Note/presentation/Add_note_grid.dart';
import 'package:to_do/features/Add_Note/presentation/Add_note_header.dart';


class AddNoteBody extends StatelessWidget {
  const AddNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
       SliverToBoxAdapter(child: Column(
         children: [
           AddNoteHeader(),
           SizedBox(height: 16,)
         ],
       ),
       ),
       AddNoteGrid(),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).size.height * 0.12),
        ),
      ],
    );
  }

}
