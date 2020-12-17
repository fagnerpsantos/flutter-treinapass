import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/utils/db_util.dart';


class ItemService {
  List<Item> _itemList = [];

  Future<List> getAllItens() async {
    final dataList = await DbUtil.getData('item');
    _itemList = dataList.map((transacoes) => Item(
      id: transacoes['id'],
      titulo: transacoes['titulo'],
      descricao: transacoes['descricao'],
      senha: transacoes['senha'],
      username: transacoes['username'],
      url: transacoes['url'],
      anotacao: transacoes['anotacao'],
    )).toList();
    return _itemList;
  }

  void addItem(Item item){
    final newItem = Item(
      id: item.id,
      titulo: item.titulo,
      descricao: item.descricao,
      senha: item.senha,
      username: item.username,
      url: item.url,
      anotacao: item.anotacao
    );
    DbUtil.insertData('item', newItem.toMap());

  }

  void editItem(int id, Item item) async {
    final newItem = Item(
      id: item.id,
      titulo: item.titulo,
      descricao: item.descricao,
      senha: item.senha,
      username: item.username,
      url: item.url,
      anotacao: item.anotacao,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("items", newItem.toMap(), whereString, whereArguments);
  }
}