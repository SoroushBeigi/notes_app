import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/constants.dart';
import 'package:notes/injections.dart';
import 'package:notes/notes_feature/domain/repositories/db_repository.dart';
import 'package:notes/notes_feature/presentation/cubit/notes_cubit.dart';
import 'package:notes/notes_feature/presentation/widgets/dialog.dart';
import 'package:notes/notes_feature/presentation/widgets/note_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    final notesCubit = context.read<NotesCubit>();
    notesCubit.getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
                context: context,
                builder: (context) => BlocProvider(
                    create: (context) => locator<NotesCubit>(),
                    child: const AddNoteDialog(
                      initialText: '',
                    )),
              ),
          child: const Icon(Icons.add)),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          final notesCubit = context.read<NotesCubit>();
          return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              error: () => const SizedBox(),
              success: () {
                return ListView.builder(
                    itemCount: notesCubit.notes.length,
                    itemBuilder: (context, index) {
                      return  NoteCard(note:notesCubit.notes[index]);
                    },);

              });
        },
      ),
    );
  }
}
