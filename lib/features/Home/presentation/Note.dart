import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/models/Note_model.dart';
import 'package:to_do/features/Edit_Note/Edit_cubit/edit_cubit.dart';
import 'package:to_do/features/Edit_Note/presentation/Edit_note.dart';


class Note extends StatefulWidget {
  const Note({super.key, required this.noteModel, required this.onActiveStateChanged, required this.docId});
final NoteModel noteModel;
final Function(bool) onActiveStateChanged;
final String docId;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool isActive=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        setState(() {
          isActive=true;
          widget.onActiveStateChanged(isActive);
        });
      },
      onTap: (){
        setState(() {
          isActive=false;
          widget.onActiveStateChanged(isActive);
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => EditCubit(),
              child: EditNote(note: widget.noteModel, docId: widget.docId,),
            ),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height*.1,
        width:MediaQuery.sizeOf(context).width*.5,
        child: Container(
          decoration: BoxDecoration(
            color: widget.noteModel.color,
            borderRadius: BorderRadius.circular(16),
            border:isActive? Border.all(
                color: Color(0xff725A03),
                width: 1
            ) :Border.all(
              color: Color(0xffC8C5CB),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.noteModel.title,style:
                TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 16,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(widget.noteModel.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
