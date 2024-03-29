import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/utils/db_util.dart';
import 'package:treina_pass/utils/encrypt_util.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';


class ItemService {
  List<Item> _itemList = [];
  EncryptUtil en = EncryptUtil();

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

  void addItem(Item item, String senha) async{
    var senhaCriptografada = await en.encryptString(item.senha, senha);
      final newItem = Item(
        id: item.id,
        titulo: item.titulo,
        descricao: item.descricao,
        senha: senhaCriptografada,
        username: item.username,
        url: item.url,
        anotacao: item.anotacao
      );

    DbUtil.insertData('item', newItem.toMap());

  }

  Future<Item> getItem(int id, String senha) async {
    String whereString = "id = ?";
    List<dynamic> whereArgumento = [id];
    final dataList = await DbUtil.getDataWhere('item',
        whereString, whereArgumento);
    String senhaDescriptografada = await en.decryptString(dataList.first["senha"],
        senha);
    return Item(
      id: dataList.first["id"],
      titulo: dataList.first["titulo"],
      descricao: dataList.first["descricao"],
      senha: senhaDescriptografada,
      username: dataList.first["username"],
      url: dataList.first["url"],
      anotacao: dataList.first["anotacao"],
    );
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