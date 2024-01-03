import 'package:flutter/material.dart';
import 'package:notes/notes_feature/data/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,5,10,5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                note.text,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
