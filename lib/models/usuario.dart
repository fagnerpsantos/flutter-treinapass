class Usuario {
  int id;
  String nome, email, senha;

  Usuario({this.id, this.nome, this.email, this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  Usuario.fromMap(Map map){
    id = map["id"];
    nome = map["nome"];
    email = map["email"];
    senha = map["senha"];
  }
}