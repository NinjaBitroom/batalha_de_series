import 'package:batalha_de_series/controllers/serie_controller.dart';
import 'package:batalha_de_series/main/app.dart';
import 'package:batalha_de_series/services/sql_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SqlService().init());
  Get.put(SerieController());
  runApp(const App());
}
