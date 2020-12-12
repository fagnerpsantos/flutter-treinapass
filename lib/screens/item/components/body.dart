import 'package:flutter/material.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/components/card_item.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:treina_pass/services/item_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ItemService ts = ItemService();
  Future<List> _loadItens;
  List<Item> _transacoes;

  @override
  void initState() {
    // TODO: implement initState
    _loadItens = _getItens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
            EdgeInsets.only(left: 60, top: 45, bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Todos os itens',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                  ),
                ),
              ],
            )
        ),
        FutureBuilder(
            future: _loadItens,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                _transacoes = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _transacoes.length,
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return cardItem(context, index, _transacoes[index]);
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

  Future<List> _getItens() async {
    return await ts.getAllItens();
  }
}