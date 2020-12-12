import 'package:flutter/material.dart';
import 'package:treina_pass/models/categoria.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:treina_pass/screens/categoria/categoria_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardCategoria(BuildContext context, Categoria categoria) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CategoriaScreen(idCategoria: categoria.id,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kBlueColor,
          boxShadow: [
            BoxShadow(
                color: Color(0x10000000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 14,
              right: 12,
              child: Text(
                categoria.nome,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 63,
              left: 16,
              child: Text(
                'Saldo em categoria',
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

