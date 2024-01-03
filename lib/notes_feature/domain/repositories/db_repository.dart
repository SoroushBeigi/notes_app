import 'package:notes/notes_feature/data/models/note.dart';
import 'package:notes/notes_feature/domain/entities/db_entity.dart';
import '../../data/local/database_provider.dart';

class DataBaseRepository {
  final DataBaseProvider dataBaseProvider;

  DataBaseRepository({required this.dataBaseProvider});

  Future<void> createOrUpdate(DataBaseEntity data) =>
      dataBaseProvider.createOrUpdate(data);

  Future<void> deleteData(String id) => dataBaseProvider.deleteData(id);

  Future<List<Note>> getAllNotes()async {
    final notes = dataBaseProvider.getAllEntities<Note>();
    return notes;
  }


}
