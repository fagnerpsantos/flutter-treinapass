
import 'package:flutter/material.dart';
import 'package:treina_pass/utils/secure_storage_util.dart';

Drawer drawer(BuildContext context) {
  final SecureStorageUtil ss = SecureStorageUtil();
  return Drawer(
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
  );
}