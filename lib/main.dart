import 'package:flutter/material.dart';

import 'package:lista_de_compras/ui/list_screen.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Compras",
      home: ListScreen(),
    );
  }
}
