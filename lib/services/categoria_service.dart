import 'package:treina_pass/models/categoria.dart';
import 'package:treina_pass/utils/db_util.dart';

class CategoriaService {
  List<Categoria> _categoriaList = [];

  Future<List> getAllCategorias() async {
    final dataList = await DbUtil.getData('categoria');
    _categoriaList = dataList.map((categorias) => Categoria(
        id: categorias['id'],
        nome: categorias['nome'],
    )).toList();
    return _categoriaList;
  }

  void addCategoria(Categoria categoria){
    final newCategoria = Categoria(
      nome: categoria.nome,
    );
    DbUtil.insertData('categoria', newCategoria.toMap());
  }

  void editCategoria(int id, Categoria categoria) async {
    final newCategoria = Categoria(
      id: id,
      nome: categoria.nome,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("categoria", newCategoria.toMap(), whereString, whereArguments);
  }

  Future<Categoria> getCategoria(int id) async {
    List<String> columnsToSelect = [
      "id",
      "nome",
    ];
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    final dataList = await DbUtil.getDataId("categoria", columnsToSelect, whereString, whereArguments);
    return Categoria.fromMap(dataList.first);
  }
}