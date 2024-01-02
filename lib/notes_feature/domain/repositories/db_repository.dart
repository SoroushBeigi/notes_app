import 'package:notes/notes_feature/domain/entities/db_entity.dart';
import '../../data/local/database_provider.dart';

class DataBaseRepository {
  final String boxName;
  final DataBaseProvider dataBaseProvider;

  DataBaseRepository({required this.dataBaseProvider, required this.boxName});

  Future<void> createOrUpdate(DataBaseEntity data) =>
      dataBaseProvider.createOrUpdate(data);

  Future<void> deleteData(String id) => dataBaseProvider.deleteData(id);
}
