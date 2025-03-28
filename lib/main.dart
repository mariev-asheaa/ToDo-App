import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/view_models/Add_note_cubit/add_note_cubit.dart';
import 'package:to_do/features/Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import 'package:to_do/features/Finished_Notes/Finished_Note_cubit/finished_notes_cubit.dart';
import 'package:to_do/features/Home/view_model/delete_note_cubit/delete_note_cubit.dart';
import 'package:to_do/features/Settings/Theme_Cubit/theme_cubit.dart';
import 'package:to_do/firebase_options.dart';
import 'features/Add_Note/presentation/Add_Note.dart';
import 'features/Finished_Notes/presentation/Finished_Notes.dart';
import 'features/Home/presentation/Home.dart';
import 'features/LogIn/presentation/Log_In.dart';
import 'features/Search_Note/presentation/search.dart';
import 'features/Settings/presentation/Setting.dart';
import 'features/SignUp/presentation/Sign_Up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _e_commerceState();
}

class _e_commerceState extends State<ToDo> {
  @override
  void initState() {
    //provide user state
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchNotesCubit()..fetchNotes()),
        BlocProvider(create: (context) => DeleteNoteCubit()),
        BlocProvider(create: (context) => FinishedNotesCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, ThemeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const Login(),
            // home: FirebaseAuth.instance.currentUser==null? const Login():const Homeview(),
            routes: {
              Home.id: (context) => const Home(),
              SignUp.id: (context) => const SignUp(),
              Login.id: (context) => const Login(),
              AddNote.id: (context) => const AddNote(),
              FinishedNotes.id: (context) => const FinishedNotes(),
              Setting.id: (context) => const Setting(),
            },
          );
        },
      ),
    );
  }
}
