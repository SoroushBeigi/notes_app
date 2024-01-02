import 'dart:convert';

import 'package:hive/hive.dart';

import '../../domain/entities/db_entity.dart';

class DataBaseProvider {
  final String boxName;

  DataBaseProvider({required this.boxName});

  Future<void> createOrUpdate(DataBaseEntity data) async {
    await Hive.box<String>(boxName).put(data.key, jsonEncode(data));
  }

  Future<void> deleteData(String id) async {
    Hive.box<String>(boxName).delete(id);
  }
}
