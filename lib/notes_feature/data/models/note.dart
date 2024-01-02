import 'package:notes/notes_feature/domain/entities/db_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'note.g.dart';

@JsonSerializable()
class Note implements DataBaseEntity{
  final String id;
  final String title;
  final String text;

  Note({
    required this.id,
    required this.title,
    required this.text,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  String get key => id;
}