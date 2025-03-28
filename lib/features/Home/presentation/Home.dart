import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import 'package:to_do/features/Home/presentation/Home_Body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: HomeBody(),
        ),
      ),
    );
  }
}
