import 'package:flutter/material.dart';
import 'package:treina_pass/models/categoria.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:treina_pass/screens/home/home_screen.dart';
import 'package:treina_pass/services/categoria_service.dart';
import 'package:treina_pass/services/item_service.dart';



class CadastrarItemScreen extends StatefulWidget {
  final int categoriaItem;

  CadastrarItemScreen({this.categoriaItem});

  @override
  _CadastrarItemScreenState createState() => _CadastrarItemScreenState();
}

class _CadastrarItemScreenState extends State<CadastrarItemScreen> {
  ItemService ts = ItemService();
  CategoriaService cs = CategoriaService();
  Item item;
  Future<List> _loadCategorias;
  List<Categoria> _contas;
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _senhaController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Categoria _categoriaSelecionada;


  @override
  void initState() {
    super.initState();
    _loadCategorias = _getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de transação"),
        backgroundColor: widget.categoriaItem == 1 ? kGreenColor : Colors.redAccent,
      ),
      body: FutureBuilder(
        future: _loadCategorias,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            _contas = snapshot.data;
            return SingleChildScrollView(
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
                        controller: _descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Descrição"),
                      ),
                      TextFormField(
                        controller: _senhaController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: "Senha"),
                      ),
                      DropdownButtonFormField(
                        value: _categoriaSelecionada,
                        onChanged: (Categoria categoria) {
                          setState(() {
                            _categoriaSelecionada = categoria;
                          });
                        },
                        items: _contas.map((e) {
                          return DropdownMenuItem<Categoria>(
                            value: e, child: Text(e.nome),
                          );
                        }).toList(),
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
                                  categoria: widget.categoriaItem);
                              ts.addItem(newItem);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(),
                                ),
                              );
                            },
                            color: widget.categoriaItem == 1 ? kGreenColor : Colors.redAccent,
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<List> _getCategorias() async {
    return await cs.getAllCategorias();
  }

}

