import 'package:flutter/material.dart';
import 'package:treina_pass/models/categoria.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/components/card_item.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:treina_pass/screens/item/item_screen.dart';
import 'package:treina_pass/services/categoria_service.dart';
import 'package:treina_pass/services/item_service.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_categoria.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ItemService ts = ItemService();
  CategoriaService cs = CategoriaService();
  Future<List> _loadItens;
  Future<List> _loadCategorias;
  List<Item> _itens;
  List<Categoria> _categorias;

  @override
  void initState() {
    // TODO: implement initState
    _loadItens = _getItens();
    _loadCategorias = _getCategorias();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 175,
              child: FutureBuilder(
                  future: _loadCategorias,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      _categorias = snapshot.data;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _categorias.length,
                          padding: EdgeInsets.only(left: 16, right: 8),
                          itemBuilder: (context, index) {
                            return cardCategoria(context, _categorias[index]);
                          },
                        );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Últimos itens cadastrados',
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
                      // physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _itens.length > 6 ? 6 : _itens.length,
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
        ),
    );

  }

  Future<List> _getItens() async {
    return await ts.getAllItens();
  }

  Future<List> _getCategorias() async {
    return await cs.getAllCategorias();
  }
}
