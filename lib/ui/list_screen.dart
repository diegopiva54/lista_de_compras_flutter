import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> itens = [];

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
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purpleAccent[400],
              child: IconTheme(
                child: Icon(Icons.add),
                data: IconThemeData(color: Colors.white),
              ),
            ),
            title: Text(
              itens[index],
              style: TextStyle(color: Colors.purple[400]),
            ),
          );
        },
      ),
    );
  }
}
