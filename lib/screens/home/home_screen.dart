import 'package:flutter/material.dart';
import 'package:treina_pass/screens/home/components/body.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("user@mail.com"),
              accountName: Text("Seu zé"),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(Icons.enhanced_encryption),
              title: Text("Minhas senhas"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favoritos"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra página
              },
            ),
          ],
        ),
      ),
    );
  }
}
