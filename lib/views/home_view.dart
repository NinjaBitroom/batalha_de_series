import 'package:batalha_de_series/controllers/serie_controller.dart';
import 'package:batalha_de_series/models/serie_model.dart';
import 'package:batalha_de_series/views/serie_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<SerieController> {
  HomeView({super.key});

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _capaController = TextEditingController();
  final TextEditingController _pontuacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
        actions: [
          IconButton(
            onPressed: () {
              controller.printSeries();
            },
            icon: const Icon(Icons.print),
          )
        ],
      ),
      body: controller.obx(
        (state) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: state?.length,
          itemBuilder: (context, index) {
            final serie = state?[index];
            return Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                title: Text(serie!.nome),
                subtitle: Text(serie.genero),
                onTap: () {
                  Get.to(
                    () => SerieDetailView(serie),
                  );
                },
              ),
            );
          },
        ),
        onEmpty: const Center(
          child: Text(
            'Nenhuma série cadastrada... Utlize o botão + para adicionar uma série',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Adicionar Série',
            textConfirm: 'Adicionar',
            textCancel: 'Cancelar',
            contentPadding: const EdgeInsets.all(24),
            onConfirm: () {
              final serie = SerieModel(
                nome: _nomeController.text,
                genero: _generoController.text,
                descricao: _descricaoController.text,
                capa: _capaController.text,
                pontuacao: double.parse(_pontuacaoController.text),
              );
              controller.addSerie(serie);
              Get.back();
              _nomeController.clear();
              _generoController.clear();
              _descricaoController.clear();
              _capaController.clear();
              _pontuacaoController.clear();
            },
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  controller: _nomeController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Gênero'),
                  controller: _generoController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  controller: _descricaoController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Capa'),
                  controller: _capaController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Pontuação'),
                  controller: _pontuacaoController,
                ),
              ],
            ),
          );
        },
        tooltip: 'Adicionar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
