class Item {
  int id, categoria;
  String titulo, descricao, senha;

  Item({this.id, this.titulo, this.descricao,
    this.categoria, this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'senha': senha,
      'categoria': categoria
    };
  }

  Item.fromMap(Map map){
    id = map["id"];
    titulo = map["titulo"];
    descricao = map["descricao"];
    senha = map["senha"];
    categoria = map["categoria"];
  }
}