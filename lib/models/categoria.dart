class Categoria {
  int id;
  String nome;

  Categoria({this.id, this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  Categoria.fromMap(Map map){
    id = map["id"];
    nome = map["nome"];
  }

}
