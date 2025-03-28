import 'package:flutter/cupertino.dart';
import 'package:to_do/features/Home/presentation/Button_navbar.dart';
import 'package:to_do/features/Home/presentation/Notes_List_View.dart';
import 'package:to_do/features/Home/presentation/Selected_button_navbar.dart';
import '../../Add_Note/presentation/Add_note_grid.dart';
import 'Home_Header.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isAnyCardActive = false;
  String? selectedDocId; // Store the selected docId

  void handleNoteCardActiveState(bool isActive, String? docId) {
    setState(() {
      if (isActive && docId != null) {
        selectedDocId = docId;
        isAnyCardActive = true;
      } else {
        selectedDocId = null;
        isAnyCardActive = false;
      }
    });
  }
  void hideNavbar() {
    setState(() {
      selectedDocId = null;
      isAnyCardActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideNavbar,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              for (var category in AddNoteGrid.noteTypes) ...[
                SliverToBoxAdapter(
                  child: HomeHeader(text: category.title),
                ),
                SliverToBoxAdapter(
                  child: NotesListView(
                    categoryIndex: category.categoryIndex??0,
                    onNoteCardActiveStateChanged: handleNoteCardActiveState,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
              ],
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.sizeOf(context).height * 0.86,
            child: isAnyCardActive ? SelectedButtonNavbar(docId: selectedDocId??'', onClose: hideNavbar,)
                : ButtonNavbar(),
          ),
        ],
      ),
    );
  }
}
