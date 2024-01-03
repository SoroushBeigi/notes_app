import 'package:notes/notes_feature/data/models/note.dart';

abstract class DataBaseEntity {
  final String key;

  DataBaseEntity({required this.key});

  factory DataBaseEntity.fromJson(Type type, Map<String, dynamic> e) {
    //We may have more types.
    switch (type) {
      case Note:
        return Note.fromJson(e);
      default:
        throw Exception();
    }
  }
}
