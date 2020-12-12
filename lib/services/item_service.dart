import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/services/categoria_service.dart';
import 'package:treina_pass/utils/db_util.dart';


class ItemService {
  List<Item> _itemList = [];
  CategoriaService cs = CategoriaService();

  Future<List> getAllItens() async {
    final dataList = await DbUtil.getData('item');
    _itemList = dataList.map((transacoes) => Item(
      id: transacoes['id'],
      titulo: transacoes['titulo'],
      descricao: transacoes['descricao'],
      senha: transacoes['senha'],
      categoria: transacoes['categoria'],
    )).toList();
    return _itemList;
  }

  void addItem(Item item){
    final newItem = Item(
      id: item.id,
      titulo: item.titulo,
      descricao: item.descricao,
      senha: item.senha,
      categoria: item.categoria
    );
    DbUtil.insertData('item', newItem.toMap());

  }

  void editItem(int id, Item item) async {
    final newItem = Item(
      id: item.id,
      titulo: item.titulo,
      descricao: item.descricao,
      senha: item.senha,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("items", newItem.toMap(), whereString, whereArguments);
  }

  Future<List> getItensCategoria(int id) async {
    String whereString = "categoria = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataWhere("item", whereString, whereArguments);
    return dataList.map((transacoes) => Item(
      id: transacoes['id'],
      titulo: transacoes['titulo'],
      descricao: transacoes['descricao'],
      senha: transacoes['senha'],
      categoria: transacoes['categoria'],
    )).toList();
  }
}