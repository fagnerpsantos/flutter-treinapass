import 'package:flutter/material.dart';
import 'package:treina_pass/screens/categoria/components/body.dart';

class CategoriaScreen extends StatefulWidget {
  final int idCategoria;

  CategoriaScreen({this.idCategoria});

  @override
  _CategoriaScreenState createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(idCategoria: widget.idCategoria,),
    );
  }
}
