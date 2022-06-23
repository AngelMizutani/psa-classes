import 'dart:io';

main() {
  // var minhaClasse = MinhaClasse('José', 50, true);
  // minhaClasse.nome = 'José';
  // minhaClasse.numero = 50;
  // minhaClasse.valido = true;

  // var nome = stdin.readLineSync()!;
  // var numero = int.parse(stdin.readLineSync()!);
  // var valido = stdin.readLineSync()! == 'S';
  // var registroAcademico = int.parse(stdin.readLineSync()!);
  // var siape = int.parse(stdin.readLineSync()!);

  var estado = Estado(nome: 'Paraná', sigla: 'PR');
  var cidade = Cidade(estado: estado, nome: 'Paranavaí');

  var aluno = Aluno(
      nome: 'Zelda',
      numero: 2,
      valido: true,
      registroAcademico: 123,
      cidade: cidade);

  var professor = Professor(
      nome: 'Fiona',
      numero: 3,
      valido: true,
      siape: 456,
      cidade: Cidade(
          nome: 'Paranavaí', estado: Estado(nome: 'Paraná', sigla: 'PR')));

  print(aluno.nome);
  print(professor.cidade.nome);

  // var aluno = Aluno(nome: nome, numero: numero, valido: valido);

  // print(aluno.nome);
}

//para criar uma classe privada, deve-se colocar underline antes do nome da classe: _MinhaClasse
class MinhaClasse {
  String? nome;
  int? numero;
  bool? valido;

  //a classe é privada, mas o construtor é publico
  // MinhaClasse(String nome, int numero, bool valido) {
  //   this.nome = nome;
  //   this.numero = numero;
  //   this.valido = valido;
  // }
  MinhaClasse({required this.nome, required this.numero, required this.valido});
}

class Pessoa {
  final String nome;
  final int numero;
  final bool valido;
  final Cidade cidade;

  Pessoa(
      {required this.nome,
      required this.numero,
      required this.valido,
      required this.cidade});
}

class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;

  Cidade({required this.nome, required this.estado});
}

class Aluno extends Pessoa {
  final int registroAcademico;

  Aluno(
      {required nome,
      required numero,
      required valido,
      required cidade,
      required this.registroAcademico})
      : super(nome: nome, numero: numero, valido: valido, cidade: cidade);
}

class Professor extends Pessoa {
  final int siape;

  Professor(
      {required nome,
      required numero,
      required valido,
      required cidade,
      required this.siape})
      : super(nome: nome, numero: numero, valido: valido, cidade: cidade);
}


/*
class Aluno {
  final String nome;
  final int numero;
  final bool valido;
  //definir atributo ano de nascimento e fazer a validação que achar necessária
  int _anoNascimento;

  set anoNascimento(int anoNascimento) {
    if (anoNascimento > 0) _anoNascimento = anoNascimento;
  }

  //criar uma propriedade idade
  int get idade {
    var anoAtual = DateTime.now().year;
    var idade = anoAtual - _anoNascimento;
    return idade;
  }

  Aluno(this.nome, this.numero, this.valido, this._anoNascimento);

  // Aluno({required this.nome, required this.numero, required this.valido});
}

//Encapsulamento
// class Aluno {
//   String _nome;
//   int? _numero;
//   bool? _valido;

//   // Aluno();

//   // String get nome {
//   //   return _nome;
//   // }

//   set nome(String nome) {
//     _nome = nome;
//   }

//   int get numero {
//     return _numero;
//   }

//   set numero(int numero) {
//     _numero = numero;
//   }

//   bool get valido {
//     return _valido;
//   }
// }
*/
