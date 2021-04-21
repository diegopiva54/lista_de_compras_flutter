import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Item'),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: [
        FlatButton(
          child: Text(
            'Adicionar Item',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green[400],
          onPressed: () {
            print(itemC.value.text);
          },
        ),
        FlatButton(
          child: Text(
            'Cancelar',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red[300],
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
