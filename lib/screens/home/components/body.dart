import 'package:flutter/material.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/components/card_item.dart';
import 'package:treina_pass/screens/item/item_screen.dart';
import 'package:treina_pass/services/item_service.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ItemService ts = ItemService();
  Future<List> _loadItens;
  List<Item> _itens;

  @override
  void initState() {
    // TODO: implement initState
    _loadItens = _getItens();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding:
                EdgeInsets.only(left: 24, bottom: 16, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Últimos logins cadastrados',
                      style: Theme.of(context).textTheme.bodyText1
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
                        style: Theme.of(context).textTheme.headline3,
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
}
