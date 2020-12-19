import 'package:shared_preferences/shared_preferences.dart';
import 'package:treina_pass/models/usuario.dart';
import 'package:treina_pass/utils/db_util.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';


class UsuarioService {
  List<Usuario> _usuarioList = [];
  final SecureStorageUtil ss = SecureStorageUtil();


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

  void addUsuario(Usuario usuario) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final newUsuario = Usuario(
        id: usuario.id,
        nome: usuario.nome,
        email: usuario.email,
        senha: usuario.senha,
    );
    ss.insertData('nome', newUsuario.nome);
    ss.insertData('email', newUsuario.email);
    ss.insertData('senha', newUsuario.senha);
    // prefs.setString('senha', newUsuario.senha);


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