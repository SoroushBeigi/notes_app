import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/notes_feature/domain/repositories/db_repository.dart';
import 'package:notes/notes_feature/presentation/cubit/notes_cubit.dart';

import 'injections.dart';
import 'notes_feature/presentation/notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}

Future<void> init() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('notes');
  await setup(box);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<NotesCubit>(),
        child: const NotesPage(),
      ),
    );
  }
}
