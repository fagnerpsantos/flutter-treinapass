import 'package:flutter/material.dart';
import 'package:treina_pass/models/categoria.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/components/card_item.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:treina_pass/screens/home/components/card_categoria.dart';
import 'package:treina_pass/screens/item/item_screen.dart';
import 'package:treina_pass/services/categoria_service.dart';
import 'package:treina_pass/services/item_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  final int idCategoria;
  Body({this.idCategoria});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ItemService ts = ItemService();
  CategoriaService cs = CategoriaService();
  Future<List> _loadItens;
  Future<Categoria> _loadCategoria;
  List<Item> _itens;
  Categoria _conta;

  @override
  void initState() {
    // TODO: implement initState
    _loadItens = _getItens(widget.idCategoria);
    _loadCategoria = _getCategoria(widget.idCategoria);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
          EdgeInsets.only(top: 67, bottom: 16),

          child: Container(
            height: 175,
            width: double.infinity,
            child: FutureBuilder(
                future: _loadCategoria,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _conta = snapshot.data;
                    return cardCategoria(context, _conta);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
            ),
          ),
        ),
        Padding(
            padding:
            EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Itens',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ItemScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'ver todas',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor,
                    ),
                  ),
                ),
              ],
            )
        ),
        FutureBuilder(
            future: _loadItens,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _itens = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _itens.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return cardItem(context, index, _itens[index]);
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        ),
      ],
    );

  }

  Future<List> _getItens(int id) async {
    return await ts.getItensCategoria(id);
  }

  Future<Categoria> _getCategoria(int id) async {
    return await cs.getCategoria(id);
  }
}
