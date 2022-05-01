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
}
