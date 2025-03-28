import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/models/Note_model.dart';
import '../view_models/Add_note_cubit/add_note_cubit.dart';
import 'Entering_data.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({required this.noteModel, required this.index,});
   final NoteModel noteModel;
   final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AddNoteCubit(),
              child: EnteringData(selectedNote: index),
            ),
          ),
        );
      },
      child: SizedBox(
         height: MediaQuery.sizeOf(context).height*.3,
         width:MediaQuery.sizeOf(context).width*.5 ,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: noteModel.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                child: Image.asset(noteModel.image??''),
              ),
              SizedBox(height: 10),
              Text(
                noteModel.title,
                style: TextStyle(
                  color: noteModel.textcolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                noteModel.description,
                style: TextStyle(
                  color: noteModel.textcolor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}