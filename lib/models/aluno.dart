import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';

class Aluno {
  String id;
  String nome;
  int idade;
  List<String> nomeCuros;
  List<Curso> cursos;
  Endereco endereco;
  Aluno({
    required this.id,
    required this.nome,
    required this.idade,
    required this.nomeCuros,
    required this.cursos,
    required this.endereco,
  });
}
