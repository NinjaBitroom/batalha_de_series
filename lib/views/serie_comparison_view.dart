import 'package:batalha_de_series/models/serie_model.dart';
import 'package:batalha_de_series/widgets/responsive_array.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SerieComparisonView extends GetView {
  final SerieModel serie1;
  final SerieModel serie2;

  const SerieComparisonView(this.serie1, this.serie2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparando as séries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResponsiveArray(
          children: [
            Expanded(
              child: Card(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        serie1.nome,
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    Text(serie1.capa),
                    Text('Gênero: ${serie1.genero}'),
                    Text('Pontuação: ${serie1.pontuacao}'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Descrição:',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Text(serie1.descricao),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        serie2.nome,
                        style: context.textTheme.titleLarge,
                      ),
                    ),
                    Text(serie2.capa),
                    Text('Gênero: ${serie2.genero}'),
                    Text('Pontuação: ${serie2.pontuacao}'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Descrição:',
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Text(serie2.descricao),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
