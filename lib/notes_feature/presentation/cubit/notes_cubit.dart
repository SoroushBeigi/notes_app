import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/notes_feature/data/models/note.dart';
import 'package:notes/notes_feature/domain/repositories/db_repository.dart';

part 'notes_state.dart';

part 'notes_cubit.freezed.dart';

class NotesCubit extends Cubit<NotesState> {
  final DataBaseRepository dataBaseRepository;

  NotesCubit({required this.dataBaseRepository})
      : super(const NotesState.initial());

  List<Note> notes = [];

  Future<void> saveNote({required String title, required String text}) async {
    final id = (notes.length + 1).toString();
    emit(const NotesState.loading());
    final note = Note(
      id: id,
      title: title,
      text: text,
    );
    await dataBaseRepository.createOrUpdate(note);
    notes.add(note);
    emit(const NotesState.success());
  }

  Future<void> getAllNotes() async {
    emit(const NotesState.loading());
    notes = await dataBaseRepository.getAllNotes();
    emit(const NotesState.success());
  }
}
