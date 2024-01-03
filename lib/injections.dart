import 'package:get_it/get_it.dart';
import 'package:notes/notes_feature/data/local/database_provider.dart';
import 'package:notes/notes_feature/domain/repositories/db_repository.dart';

// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/notes_feature/presentation/cubit/notes_cubit.dart';

GetIt locator = GetIt.I;

setup(box) async {
  //providers
  locator.registerSingleton<DataBaseProvider>(DataBaseProvider(box: box));

  //repositories
  locator.registerSingleton<DataBaseRepository>(
      DataBaseRepository(dataBaseProvider: locator()));

  //Cubits
  locator.registerSingleton(
      NotesCubit(dataBaseRepository: locator<DataBaseRepository>()));
  //HiveBox
  locator.registerSingleton<Box>(box);
}
