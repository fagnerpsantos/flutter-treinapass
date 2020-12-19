import 'package:flutter/material.dart';
import 'package:treina_pass/screens/home/components/body.dart';
import 'package:treina_pass/screens/home/components/drawer.dart';
import 'package:treina_pass/screens/home/components/float_action_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Body(),
      floatingActionButton: buildFloatActionButton(context),
      appBar: AppBar(
        title: Text("TreinaPass"),
      ),
      drawer: drawer(context),
    );
  }
}
