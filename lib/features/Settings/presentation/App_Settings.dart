import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/SignUp/AuthBloc/auth_bloc.dart';

import '../Theme_Cubit/theme_cubit.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'APP SETTINGS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.dark_mode, color: Colors.black),
          title: Text(
            'Dark Mode',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              context.read<AuthBloc>().add(SignOutEvent());
            },
            icon: Icon(Icons.logout, color: Colors.red),
            label: Text('Log Out', style: TextStyle(color: Colors.red)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              side: BorderSide(color: Colors.red),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
