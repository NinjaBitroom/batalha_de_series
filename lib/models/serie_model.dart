class SerieModel {
  final String nome;
  final String genero;
  final String descricao;
  final String capa;
  final double pontuacao;

  SerieModel({
    required this.nome,
    required this.genero,
    required this.descricao,
    required this.capa,
    required this.pontuacao,
  });

  factory SerieModel.fromMap(Map<String, dynamic> map) {
    return SerieModel(
      nome: map['nome'],
      genero: map['genero'],
      descricao: map['descricao'],
      capa: map['capa'],
      pontuacao: map['pontuacao'],
    );
  }
}
