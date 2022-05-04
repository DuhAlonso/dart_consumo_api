import 'dart:convert';

import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';

class Aluno {
  String? id;
  String nome;
  int idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;
  Aluno({
    this.id,
    required this.nome,
    required this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'cursos': cursos.map((curso) => curso.toMap()).toList(),
      'endereco': endereco.toMap(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      idade: map['idade']?.toInt() ?? 0,
      //nomeCursos: List<String>.from(map['nomeCursos']),
      nomeCursos: map['nomeCursos'].cast<String>(),
      cursos: List<Curso>.from(
          map['cursos']?.map((cursoMap) => Curso.fromMap(cursoMap))).toList(),
      endereco: Endereco.fromMap(map['endereco']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) => Aluno.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, cursos: $cursos, endereco: $endereco)';
  }
}
