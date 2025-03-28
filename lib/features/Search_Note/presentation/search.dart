import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/features/Add_Note/models/Note_model.dart';

import '../../Home/presentation/Note.dart';



class CustomSearch extends SearchDelegate<NoteModel?> {
  final List<NoteModel> notes;

  CustomSearch(this.notes);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear search field
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<NoteModel> results = notes
        .where((note) =>
    note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return results.isEmpty
        ? const Center(child: Text("No notes found"))
        : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio:  20 / 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: Note(
              noteModel: results[index],
                onActiveStateChanged: (bool ){},
                docId: results[index].docId??'',
              ),
            ),
          );
                },
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<NoteModel> suggestions = notes
        .where((note) =>
    note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title),
          subtitle: Text(
            suggestions[index].description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            query = suggestions[index].title;
            showResults(context);
          },
        );
      },
    );
  }
}
