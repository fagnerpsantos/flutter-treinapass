import 'package:flutter/material.dart';
import 'package:treina_pass/screens/cadastrar_item/cadastrar_item_screen.dart';

FloatingActionButton buildFloatActionButton(BuildContext context) {

  return FloatingActionButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CadastrarItemScreen(),
        ),
      );
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.red,
  );
}