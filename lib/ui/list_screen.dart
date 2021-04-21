import 'package:flutter/material.dart';

import 'package:lista_de_compras/models/item.dart';
import 'package:lista_de_compras/ui/add_item.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> itens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Compras'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: Colors.purple[400]),
        itemCount: itens.length,
        itemBuilder: (context, index) {
          final item = itens[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purpleAccent[400],
              child: IconTheme(
                child: Icon(Icons.check),
                data: IconThemeData(color: Colors.white),
              ),
            ),
            title: Text(
              item.title,
              style: TextStyle(color: Colors.purple[400]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[400],
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() {
    showDialog(
        // abre uma modal neste contexto
        context: context,
        builder: (BuildContext context) {
          return new AddItem();
        });
  }
}
