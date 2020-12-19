import 'package:flutter/material.dart';
import 'package:treina_pass/models/usuario.dart';
import 'package:treina_pass/screens/home/home_screen.dart';
import 'package:treina_pass/services/usuario_service.dart';

class CadastrarUsuarioScreen extends StatefulWidget {
  @override
  _CadastrarUsuarioScreenState createState() => _CadastrarUsuarioScreenState();
}

class _CadastrarUsuarioScreenState extends State<CadastrarUsuarioScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  UsuarioService us = UsuarioService();

  @override
  Widget build(BuildContext context) {
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
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
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 62),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              controller: _nomeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Nome'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            margin: EdgeInsets.only(top: 32),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Email'),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            margin: EdgeInsets.only(top: 32),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              controller: _senhaController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Senha'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Usuario novoUsuario = Usuario(
                        nome: _nomeController.text,
                        email: _emailController.text,
                        senha: _senhaController.text
                      );
                      us.addUsuario(novoUsuario);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(),
                        ),
                      );
                    },
                    splashColor: Colors.red,
                    highlightColor: Colors.red,
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text("Cadastrar usuário"),
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
  }
}
