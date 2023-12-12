import 'dart:convert';

class Dependente {
  late String _nome;

Dependente(String nome) {
    this._nome = nome;
  }

String toJson() {
    return json.encode({"nome": _nome});
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

Funcionario(String nome, List<Dependente> dependentes) { this._nome = nome; this._dependentes = dependentes; }

String toJson() {
    List<dynamic> dependentes = [];
    _dependentes.forEach((dependente) {
      dependentes.add(jsonDecode(dependente.toJson()));
    });
    return json.encode({"nome": _nome, "dependentes": dependentes});
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

String toJson() {
    List<dynamic> funcionarios = [];
    _funcionarios.forEach((funcionario) {
      funcionarios.add(jsonDecode(funcionario.toJson()));
    });
    return json.encode({"projeto": _nomeProjeto, "funcionarios": funcionarios});
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  final dependenteUno = Dependente("Bruh");
  final dependenteDos = Dependente("Broh");
  final dependenteTres = Dependente("Breh");

// 2. Criar varios objetos Funcionario
  final trabajador = Funcionario("Bob", [dependenteUno]);
  final trabajadorPlus = Funcionario("Mathias", [dependenteDos]);
  final trabajadorGerente = Funcionario("Jeremy", [dependenteTres]);

// 3. Associar os Dependentes criados aos respectivos funcionarios

// 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [trabajador, trabajadorPlus , trabajadorGerente];

// 5. criar um objeto Equipe Projeto chamando o metodo contrutor que da nome ao projeto e insere uma coleção de funcionario
  final equipeProjeto = EquipeProjeto("Projeto A", funcionarios);

// 6. Printar no formato JSON o objeto Equipe Projeto.
  print(equipeProjeto.toJson());
}