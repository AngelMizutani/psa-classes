void main() {
  /*
  var bola = Bola();
  bola.categoria = 'basquete';
  bola.cor = 'laranja';
  bola.tamanho = 9;

  print(bola.cor);

  var professor = Professor(1, 'Zelda', '12345678900', 'zelda@email.com');
  print(professor.nome);
  
  var aluno = Aluno(
      cpf: '123456', nome: 'Fiona', ra: '123', telefone: '(44)9 9812-3456');

  print(aluno.cpf);
  
  var peca = Peca(123, 'parafuso', 'ferragens', 0.3);
  print(peca.precoVenda);

  var carro = Carro('Fusca', 1978);
  print(carro.tempoUso);
  

  var cidade =
      Cidade(nome: 'Maringá', estado: Estado(nome: 'Paraná', sigla: 'PR'));
  print(cidade.estado.sigla);
  

  var funcionario = Funcionario(
      nome: 'Miyuki',
      cpf: '456789',
      telefone: '123456',
      cidade: Cidade(
          nome: 'Florianópolis',
          estado: Estado(nome: 'Santa Catarina', sigla: 'SC')));

  print(funcionario.cidade.estado.nome);
  */

  var peca2 = Peca2(
      nome: 'freio',
      tipo: Tipo(
          nome: 'auto',
          categoria:
              Categoria(nome: 'cat', descricao: 'descricao da categoria')),
      unidadeMedida: UnidadeMedida(sigla: 'kg', descricao: 'kilograma'),
      fabricante: Fabricante(
          nome: 'Marca',
          cidade: Cidade(
              nome: 'São Paulo',
              estado: Estado(nome: 'São Paulo', sigla: 'SP'))));

  print(peca2.fabricante.nome);
}

/*
1)Para atribuir um valor em um atributo, qual a diferença em: 
(i) atribuir um valor no atributo na  definição da classe; 
e (ii) solicitar o seu valor via parâmetro do construtor?

2)O que é para que serve construtor? Qual código pode-se definir nele?
3)Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?

4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
    * → obrigatório
    = valor (valor padrão)
    ? pode ser nulo
  Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não. 
  a) Bola{cor=branco,tamanho=7, categoria?}
*/
class Bola {
  String cor = 'branco';
  int tamanho = 7;
  String? categoria;
}

/*
  b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor
*/
class Professor {
  int? id;
  String? nome;
  String? cpf;
  String? email;

  Professor(this.id, this.nome, this.cpf, this.email);
}

/*
  c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, 
  inicialize todos os atributos no contrutor utilizando parâmetros nomeados
*/
class Aluno {
  final String ra;
  final String nome;
  final String cpf;
  final String telefone;

  Aluno(
      {required this.ra,
      required this.nome,
      required this.cpf,
      required this.telefone});
}

/*
  d) Peça{código, nome, descrição, preço de custo} 
    → get nome e descição, get preço de venda (30% sobre o preço de custo)
    → set código - somente números positivos 
    → set preço de custo - somente valore positivos
*/
class Peca {
  int _codigo;
  String _nome;
  String _descricao;
  double precoCusto;

  String get nome {
    return _nome;
  }

  String get descricao {
    return _descricao;
  }

  set codigo(int codigo) {
    if (codigo >= 0) {
      _codigo = codigo;
    }
  }

  double get precoVenda {
    var precoVenda = precoCusto * 1.3;

    return precoVenda;
  }

  Peca(this._codigo, this._nome, this._descricao, this.precoCusto);
}

/*
  e) Carro{nome, ano fabricação} 
    → get tempo de uso, get nome e ano fabricação
    → set ano fabricação - somente ano positivo e coerente
*/
class Carro {
  String _nome;
  int _anoFabricacao;

  String get nome {
    return _nome;
  }

  int get tempoUso {
    var anoAtual = DateTime.now().year;
    var tempoUso = anoAtual - _anoFabricacao;

    return tempoUso;
  }

  int get anoFabricacao {
    return _anoFabricacao;
  }

  set anoFabricacao(int ano) {
    if (ano > 1886) {
      _anoFabricacao = ano;
    }
  }

  Carro(this._nome, this._anoFabricacao);
}

/*
  f) Cidade{nome,Estado{nome,sigla}}
*/
class Estado {
  final String nome;
  final String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  final String nome;
  final Estado estado;

  Cidade({required this.nome, required this.estado});
}

/*
  g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}
*/
class Funcionario {
  final String nome;
  final String cpf;
  final String telefone;
  final Cidade cidade;

  Funcionario(
      {required this.nome,
      required this.cpf,
      required this.telefone,
      required this.cidade});
}

/*
  h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao}, Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}
*/
class Fabricante {
  final String nome;
  final Cidade cidade;

  Fabricante({required this.nome, required this.cidade});
}

class UnidadeMedida {
  final String sigla;
  final String descricao;

  UnidadeMedida({required this.sigla, required this.descricao});
}

class Categoria {
  final String nome;
  final String descricao;

  Categoria({required this.nome, required this.descricao});
}

class Tipo {
  final String nome;
  final Categoria categoria;

  Tipo({required this.nome, required this.categoria});
}

class Peca2 {
  final String nome;
  final Tipo tipo;
  final UnidadeMedida unidadeMedida;
  final Fabricante fabricante;

  Peca2(
      {required this.nome,
      required this.tipo,
      required this.unidadeMedida,
      required this.fabricante});
}

/*
  i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.
  */
