import 'dart:convert';

import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('Flutter BR');
    await _alunosRepository.update(aluno);
    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Antonio José',
      idade: 40,
      nomeCursos: ['Curso 1', 'Curso 2'],
      cursos: [
        Curso(id: 1, nome: 'Curso Completo 1', isAluno: true),
      ],
      endereco: Endereco(
        rua: 'Rua Maior',
        numero: 1478,
        cep: '0487877',
        telefone: Telefone(ddd: 14, telefone: '1544844456'),
        cidade: Cidade(id: 3, nome: 'Vila Nova'),
      ),
    );

    await _alunosRepository.insert(aluno);
  }

  Future<void> delete() async {
    _alunosRepository.delete('5e8d9270-cb3e-11ec-8bec-d9d90286bf8b');
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }
}
