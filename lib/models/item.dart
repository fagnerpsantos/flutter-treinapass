class Item {
  int id;
  String titulo, descricao, senha, username, url, anotacao;

  Item({this.id, this.titulo, this.descricao, this.senha, this.username,
  this.url, this.anotacao});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'senha': senha,
      'username': username,
      'url': url,
      'anotacao': anotacao,
    };
  }

  Item.fromMap(Map map){
    id = map["id"];
    titulo = map["titulo"];
    descricao = map["descricao"];
    senha = map["senha"];
    username = map["username"];
    url = map["url"];
    anotacao = map["anotacao"];
  }
}