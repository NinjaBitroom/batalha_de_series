import 'package:batalha_de_series/controllers/serie_controller.dart';
import 'package:batalha_de_series/models/serie_model.dart';
import 'package:batalha_de_series/views/serie_choose_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerieDetailView extends GetView<SerieController> {
  final SerieModel serie;

  const SerieDetailView(this.serie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(serie.nome),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serie.capa),
                  Text('Gênero: ${serie.genero}'),
                  Text('Pontuação: ${serie.pontuacao}'),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição:',
                    style: context.textTheme.titleSmall,
                  ),
                  Text(serie.descricao),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => SerieChooseView(serie));
        },
        label: const Text('Comparar'),
        icon: const Icon(Icons.compare_arrows),
      ),
    );
  }
}
