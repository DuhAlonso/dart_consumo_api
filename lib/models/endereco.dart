import 'dart:convert';

import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/telefone.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Telefone telefone;
  Cidade cidade;
  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.telefone,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'cep': cep,
      'telefone': telefone.toMap(),
      'cidade': cidade.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero']?.toInt() ?? 0,
      cep: map['cep'] ?? '',
      telefone: Telefone.fromMap(map['telefone']),
      cidade: Cidade.fromMap(map['cidade']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, cep: $cep, telefone: $telefone, cidade: $cidade)';
  }
}
