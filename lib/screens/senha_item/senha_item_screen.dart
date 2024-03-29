import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treina_pass/screens/detalhes_item/detalhes_item_screen.dart';
import 'package:treina_pass/screens/item/item_screen.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';

class SenhaItemScreen extends StatefulWidget {
  int idLogin;

  SenhaItemScreen({this.idLogin});

  @override
  _SenhaItemScreenState createState() => _SenhaItemScreenState();
}

class _SenhaItemScreenState extends State<SenhaItemScreen> {
  final _senhaController = TextEditingController();
  SecureStorageUtil ss = SecureStorageUtil();

  Future<String> _loadSenha;
  String _senha;


  @override
  void initState() {
    // TODO: implement initState
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
            body: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2.5,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  bottomRight: Radius.circular(90),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Spacer(),
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.enhanced_encryption_rounded,
                                    size: 90,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 2,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            padding: EdgeInsets.only(top: 62),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 1.2,
                                  height: 45,
                                  padding: EdgeInsets.only(
                                      top: 4, left: 16, right: 16, bottom: 4),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                      color: Colors.black12,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5)
                                      ]),
                                  child: TextField(
                                    controller: _senhaController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Senha'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () async {
                            if (_senha == _senhaController.text) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => DetalhesItemScreen(
                                    idLogin: widget.idLogin,
                                    senha: _senha,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => SenhaItemScreen(),
                                ),
                              );
                            }

                          },
                          splashColor: Colors.red,
                          highlightColor: Colors.red,
                          child: Container(
                            height: 45,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Text("Acessar login"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
