import 'package:treina_pass/models/usuario.dart';
import 'package:treina_pass/utils/db_util.dart';


class UsuarioService {
  List<Usuario> _usuarioList = [];

  Future<List> getAllItens() async {
    final dataList = await DbUtil.getData('usuario');
    _usuarioList = dataList.map((usuarios) => Usuario(
      id: usuarios['id'],
      nome: usuarios['nome'],
      email: usuarios['email'],
      senha: usuarios['senha'],
    )).toList();
    return _usuarioList;
  }

  void addUsuario(Usuario usuario){
    final newUsuario = Usuario(
        id: usuario.id,
        nome: usuario.nome,
        email: usuario.email,
        senha: usuario.senha,
    );
    DbUtil.insertData('usuario', newUsuario.toMap());

  }

  void editUsuario(int id, Usuario usuario) async {
    final newUsuario = Usuario(
      id: usuario.id,
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
    );
    String whereString = "id = ?";
    int rowId = id;
    List<dynamic> whereArguments = [rowId];
    DbUtil.editData("usuarios", newUsuario.toMap(), whereString, whereArguments);
  }
}