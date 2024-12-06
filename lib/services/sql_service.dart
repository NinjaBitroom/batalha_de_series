import 'package:batalha_de_series/models/serie_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqlService extends GetxService {
  late Database db;

  Future<SqlService> init() async {
    sqfliteFfiInit();
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else if (GetPlatform.isWindows) {
      databaseFactory = databaseFactoryFfi;
    }
    db = await openDatabase('series.db');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS series(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        genero TEXT,
        descricao TEXT,
        capa TEXT,
        pontuacao REAL
      )
    ''');
    return this;
  }

  Future<void> addOne(SerieModel model) async {
    await db.insert('series', {
      'nome': model.nome,
      'genero': model.genero,
      'descricao': model.descricao,
      'capa': model.capa,
      'pontuacao': model.pontuacao,
    });
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    return await db.query('series');
  }
}
