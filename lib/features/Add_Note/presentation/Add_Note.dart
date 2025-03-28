import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/presentation/Add_note_body.dart';
import 'package:to_do/features/Add_Note/view_models/Add_note_cubit/add_note_cubit.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  static String id = 'add';

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (context) => AddNoteCubit(),
            child: AddNoteBody(),
          ),
        ),
      ),
    );
  }
}
