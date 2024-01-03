import 'dart:convert';


import 'package:hive/hive.dart';

import '../../domain/entities/db_entity.dart';

class DataBaseProvider {
  final Box box;

  DataBaseProvider({required this.box});

  Future<void> createOrUpdate(DataBaseEntity data,) async {
    box.put(data.key, jsonEncode(data));
  }

  Future<void> deleteData(String id) async {
    box.delete(id);
  }

  Future<List<T>> getAllEntities<T extends DataBaseEntity>()async  {
    final data = box.values.map((e) {
      return DataBaseEntity.fromJson(
          T, Map<String, dynamic>.from(jsonDecode(e)));
    }).toList();
    return List<T>.from(data);
  }
}
