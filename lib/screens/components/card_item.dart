import 'package:flutter/material.dart';
import 'package:treina_pass/models/item.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardItem(BuildContext context, int index, Item item) {
  return Container(
    margin: EdgeInsets.only(bottom: 8, left: 10, right: 10),
    height: 68,
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
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  item.descricao,
                  style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

