import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/services/item_service.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';

class DetalhesItemScreen extends StatefulWidget {
  int idLogin;
  String senha;

  DetalhesItemScreen({this.idLogin, this.senha});

  @override
  _DetalhesItemScreenState createState() => _DetalhesItemScreenState();
}

class _DetalhesItemScreenState extends State<DetalhesItemScreen> {
  SecureStorageUtil ss = SecureStorageUtil();
  ItemService ts = ItemService();
  Future<Item> _loadItem;
  Item _item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadItem = _getItem(widget.idLogin, widget.senha);

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadItem,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
        _item = snapshot.data;
        return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes do Login"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Título"),
                    initialValue: _item.titulo,
                  ),
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Username"),
                    initialValue: _item.username,
                  ),
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Descrição"),
                    initialValue: _item.descricao,
                  ),
                  InkWell(
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: _item.senha));
                      alertDialog(context);
                    },
                    child: TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: "Senha"),
                      initialValue: _item.senha,
                    ),
                  ),
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Url"),
                    initialValue: _item.url,
                  ),
                  TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Anotação"),
                    initialValue: _item.anotacao,
                  ),
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
  Future<Item> _getItem(int id, String senha) async {
    return await ts.getItem(id, senha);
  }


  //Function which shows Alert Dialog
  alertDialog(BuildContext context) {
    // This is the ok button
    Widget ok = FlatButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context).pop();},
    );
    // show the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Senha copiada com sucesso"),
          actions: [
            ok,
          ],
          elevation: 3,

        );
      },
    );
  }
}
