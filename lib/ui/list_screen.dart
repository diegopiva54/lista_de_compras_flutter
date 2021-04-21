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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(color: Colors.purple[400]),
          itemCount: itens.length,
          itemBuilder: (context, index) {
            final item = itens[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purpleAccent[400],
                child: IconTheme(
                  child: Icon(itens[index].isDone
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  data: IconThemeData(color: Colors.white),
                ),
              ),
              title: Text(
                item.title,
                style: TextStyle(color: Colors.purple[400], decoration: Text),
              ),
              onTap: () {
                setState(() {
                  itens[index].isDone = !itens[index].isDone;
                  _refresh();
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[400],
        child: Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        // abre uma modal neste contexto
        context: context,
        builder: (BuildContext context) {
          return new AddItem();
        });
    if (item != null) {
      setState(() {
        itens.add(item);
        _refresh();
      });
    }
  }

  Future<void> _refresh() async {
    // Future retorna alguma coisa no futuro
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      itens.sort((a, b) {
        if (a.isDone && !b.isDone) return 1;
        if (!a.isDone && b.isDone) return -1;
        return 0;
      });
    });
  }
}
