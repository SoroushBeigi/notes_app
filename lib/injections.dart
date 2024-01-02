import 'package:get_it/get_it.dart';
import 'package:notes/notes_feature/data/local/database_provider.dart';
import 'package:notes/notes_feature/domain/repositories/db_repository.dart';

GetIt locator = GetIt.I;

setup() async {

  //providers
  locator.registerSingleton<DataBaseProvider>(DataBaseProvider(boxName: 'box'));

  //repositories
  locator.registerSingleton<DataBaseRepository>(DataBaseRepository(boxName: 'box',dataBaseProvider: locator()));
}
