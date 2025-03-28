import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/Add_Note/presentation/Add_Note.dart';
import 'package:to_do/features/Finished_Notes/presentation/Finished_Notes.dart';
import 'package:to_do/features/Settings/presentation/Setting.dart';
import '../../Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import '../../Search_Note/presentation/search.dart';
import 'Home.dart';


class ButtonNavbar extends StatefulWidget {
  const ButtonNavbar({super.key});

  @override
  State<ButtonNavbar> createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height*.1,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: ()=>Navigator.pushNamed(context, Home.id),
                  child: _buildNavItem(Icons.home, "Home", selectedIndex==0)
              ),
              InkWell(
                onTap: ()=>Navigator.pushNamed(context, FinishedNotes.id),
                child: _buildNavItem(Icons.checklist, "Finished",selectedIndex==1),
              ),
              SizedBox(width: 56),

              InkWell(
                  onTap: (){
                    final state = context.read<FetchNotesCubit>().state;
                    if (state is FetchSuccess) {
                      showSearch(
                        context: context,
                        delegate: CustomSearch(state.notes),
                      );
                    }
                  },
                  child: _buildNavItem(Icons.search, "Search",selectedIndex==2)),

              InkWell(
                  onTap: ()=>Navigator.pushNamed(context, Setting.id),
                  child: _buildNavItem(Icons.settings, "Settings",selectedIndex== 3)),
            ],
          ),

          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddNote.id);
            },
            backgroundColor: Colors.purple,
            elevation: 2.0,
            shape: CircleBorder(),
            child: Icon(Icons.add, size: 32,color: Colors.white,),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label,bool isSelected) {
    return Column(
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.purple : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.purple : Colors.grey,
          ),
        ),
      ],
    );
  }
}

