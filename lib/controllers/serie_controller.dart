import 'package:batalha_de_series/models/serie_model.dart';
import 'package:batalha_de_series/services/sql_service.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SerieController extends GetxController with StateMixin<List<SerieModel>> {
  final SqlService _sqlService = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    final seriesFromDb = await _sqlService.getAll();
    final series = seriesFromDb.map((e) => SerieModel.fromMap(e)).toList();
    if (series.isEmpty) {
      change(null, status: RxStatus.empty());
      return;
    }
    change(series, status: RxStatus.success());
  }

  Future<void> addSerie(SerieModel serie) async {
    await _sqlService.addOne(serie);
    final seriesFromDb = await _sqlService.getAll();
    final series = seriesFromDb.map((e) => SerieModel.fromMap(e)).toList();
    change(series, status: RxStatus.success());
  }

  SerieModel? getSerie(int index) {
    return state?[index];
  }

  Future<void> printSeries() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) => pw.Center(
          child: pw.ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return pw.Column(
                children: [
                  pw.Text(
                    state![index].nome,
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text('Gênero: ${state![index].genero}'),
                  pw.Text('Descrição: ${state![index].descricao}'),
                  pw.Text('Pontuação: ${state![index].pontuacao}'),
                  pw.Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
