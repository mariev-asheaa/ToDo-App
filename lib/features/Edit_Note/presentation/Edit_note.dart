import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/models/Note_model.dart';

import '../../../core/Colors_list.dart';
import '../../../core/constants.dart';
import '../../Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import '../Edit_cubit/edit_cubit.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note, required this.docId, });

 final NoteModel note;
  final String docId;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
 late String title ;
 late String description;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 int selectedColorIndex = 0;
 @override
 void initState() {
   super.initState();
   title = widget.note.title;
   description = widget.note.description;
 }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Stack(
              children:[
                SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios, color: kprimary, size: 16),
                          const Text('Back', style: TextStyle(color: kprimary, fontSize: 14)),
                        ],
                      ),
                    ),
                    TextFormField(
                      initialValue: title,
                      onChanged: (data) {
                        setState(() {
                          title = data;
                        });
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      initialValue: description,
                      onChanged: (data) {
                        setState(() {
                          description = data;
                        });
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                      maxLines: 60,
                    ),
                  ],
                ),
              ),
                Positioned(
                  left: MediaQuery.sizeOf(context).width*.48,
                  right: 0,
                  top: MediaQuery.sizeOf(context).height * 0.4,
                  child: colorlist(
                    selectedIndex: selectedColorIndex,
                    onColorSelected: (index ) {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },),
                ),
              ]
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             widget.note.title=title;
             widget.note.description=description;

             context.read<EditCubit>().editNote(
               title: title,
               description: description,
               docId: widget.docId,
               color: colores[selectedColorIndex],
             );
              context.read<FetchNotesCubit>().fetchNotes();
              Navigator.pop(context);
          },
          backgroundColor: Colors.purple,
          elevation: 2.0,
          shape: CircleBorder(),
          child: Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }
}
