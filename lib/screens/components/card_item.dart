import 'package:flutter/material.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/senha_item/senha_item_screen.dart';

Widget cardItem(BuildContext context, int index, Item item) {
  return Container(
    margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Color(0x04000000),
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0.0, 8.0))
        ],
        color: Colors.black12),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SenhaItemScreen(idLogin: item.id,),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      item.titulo,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      item.username,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      item.senha,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                )
              ],
            ),
        ],
      ),
    ),
  );
}

