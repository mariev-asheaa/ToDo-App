import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/Dialoge.dart';
import 'package:to_do/features/Home/view_model/delete_note_cubit/delete_note_cubit.dart';
import '../../../generated/assets.dart';
import '../../Add_Note/view_models/Fetch_notes_cubit/fetch_notes_cubit.dart';
import '../../Finished_Notes/Finished_Note_cubit/finished_notes_cubit.dart';

class SelectedButtonNavbar extends StatefulWidget {
  const SelectedButtonNavbar({super.key, required this.docId, required this.onClose});

final String docId;
final VoidCallback onClose;
  @override
  State<SelectedButtonNavbar> createState() => _SelectedButtonNavbarState();
}
class _SelectedButtonNavbarState extends State<SelectedButtonNavbar> {
  int selectedIndex = 0;
  bool isFinished=false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height*.1,
      width: double.infinity,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){
               showFinishedDialog(
                 image: Assets.assetsIcon1,
                   context: context,
                   title: 'Notes Finished',
                   subtitle: 'The selected notes has been mark as finished, and moved to the “Finished” menu.'
               );
                    setState(() {
                      selectedIndex = 0;
                      isFinished=true;
                       });
                    context.read<FinishedNotesCubit>().toggleFinished(widget.docId, isFinished);
                    widget.onClose();
                       },
                  child: _buildNavItem(Icons.check_circle, "Finished",selectedIndex == 0)
              ),
              SizedBox(width: 16,),

              InkWell(
                  onTap:(){
                    showFinishedDialog(
                        image: Assets.assetsIcon2,
                        context: context,
                        title: 'Notes Deleted',
                        subtitle: 'The selected notes has been removed.'
                    );
                    setState(() {
                      selectedIndex = 1;
                    });
                    context.read<DeleteNoteCubit>().deleteNote(docId: widget.docId);
                    context.read<FetchNotesCubit>().fetchNotes();
                    widget.onClose();
                  },
                  child: _buildNavItem(Icons.delete, "Delete", selectedIndex == 1),
              ),
            ],
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
            color: isSelected? Colors.purple : Colors.grey,
          ),
        ),
      ],
    );
  }
}

