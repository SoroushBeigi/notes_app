import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'notes_feature/presentation/notes_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}

Future<void> init() async {
  await Hive.initFlutter();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
