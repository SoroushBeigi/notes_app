import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/constants.dart';
import 'package:notes/notes_feature/data/models/note.dart';
import 'package:notes/notes_feature/presentation/cubit/notes_cubit.dart';

class AddNoteDialog extends StatefulWidget {
  final String? initialText;
  final String? initialTitle;

  const AddNoteDialog({this.initialText, this.initialTitle, super.key});

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  late final TextEditingController textController;
  late final TextEditingController titleController;

  @override
  void initState() {
    textController = TextEditingController();
    titleController = TextEditingController();
    textController.text = widget.initialText ?? '';
    titleController.text = widget.initialTitle ?? '';
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notesCubit = context.read<NotesCubit>();
    return AlertDialog(
      backgroundColor: Colors.blue[400],
      title: const Text(
        Constants.addNoteDialogTitle,
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: Constants.addNoteTitleHint,
                  fillColor: Colors.white,
                  filled: true),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                  hintText: Constants.addNoteTextHint,
                  fillColor: Colors.white,
                  filled: true),
              maxLines: 10,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            Constants.noteCancelButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            notesCubit.saveNote(
              title: titleController.text,
              text: textController.text,
            );
            Navigator.of(context).pop();
          },
          child: const Text(
            Constants.noteAddButton,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
