import 'package:flutter/material.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/home/home_screen.dart';
import 'package:treina_pass/services/item_service.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';

class CadastrarItemScreen extends StatefulWidget {
  final int categoriaItem;

  CadastrarItemScreen({this.categoriaItem});

  @override
  _CadastrarItemScreenState createState() => _CadastrarItemScreenState();
}

class _CadastrarItemScreenState extends State<CadastrarItemScreen> {
  ItemService ts = ItemService();
  Item item;
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _usernameController = TextEditingController();
  final _urlController = TextEditingController();
  final _anotacaoController = TextEditingController();
  SecureStorageUtil ss = SecureStorageUtil();
  Future<String> _loadSenha;
  String _senha;

  @override
  void initState() {
    super.initState();
    _loadSenha = _getSenha();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadSenha,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _senha = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text("Cadastrar Login"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: _tituloController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Título"),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Username"),
                      ),
                      TextFormField(
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),

                      TextFormField(
                        controller: _senhaController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Senha"),
                      ),
                      TextFormField(
                        controller: _urlController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Url"),
                      ),
                      TextFormField(
                        controller: _anotacaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Anotação"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              Item newItem = Item(
                                  titulo: _tituloController.text,
                                  descricao: _descricaoController.text,
                                  senha: _senhaController.text,
                                  username: _usernameController.text,
                                  url: _urlController.text,
                                  anotacao: _anotacaoController.text
                              );
                              ts.addItem(newItem, _senha);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        }
    );
  }
  Future<String> _getSenha() async {
    return await ss.getData('senha');
  }
}
