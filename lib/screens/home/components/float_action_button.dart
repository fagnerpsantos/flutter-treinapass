import 'package:flutter/material.dart';
import 'package:treina_pass/screens/cadastrar_item/cadastrar_item_screen.dart';
import 'package:treina_pass/screens/constants/color_contant.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

SpeedDial buildSpeedDial(BuildContext context) {
  bool dialVisible = true;

  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    // child: Icon(Icons.add),
    visible: dialVisible,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: kGreenColor,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CadastrarItemScreen(
                categoriaItem: 1,
              ),
            ),
          );
        },
        label: 'Entrada',
        labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: kGreenColor,
      ),
      SpeedDialChild(
        child: Icon(Icons.remove, color: Colors.white),
        backgroundColor: Colors.redAccent,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CadastrarItemScreen(
                categoriaItem: 2,
              ),
            ),
          );
        },
        label: 'Saída',
        labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: Colors.redAccent,
      ),
    ],
  );
}