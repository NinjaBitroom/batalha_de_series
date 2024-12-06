import 'package:batalha_de_series/controllers/serie_controller.dart';
import 'package:batalha_de_series/models/serie_model.dart';
import 'package:batalha_de_series/views/serie_comparison_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerieChooseView extends GetView<SerieController> {
  final SerieModel firstSerie;

  const SerieChooseView(this.firstSerie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha a série para comparar'),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state!.length,
          itemBuilder: (context, index) => Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              title: Text(state[index].nome),
              subtitle: Text(state[index].genero),
              onTap: () {
                Get.to(SerieComparisonView(firstSerie, state[index]));
              },
              enabled: state[index] != firstSerie,
            ),
          ),
        ),
      ),
    );
  }
}
