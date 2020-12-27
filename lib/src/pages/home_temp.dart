import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final List<String> opciones = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Componentes Temps"),
  ),
  body: ListView(
    children: _crearItemsCorta()
  ),
);
  }

// List<Widget> _crearItems() {

//   List<Widget> lista = [];

//   for (String i in opciones) {
//     final tempWidget = ListTile(
//       title: Text(i),
//       subtitle: Text("Cualquier cosa"),
//     );
//     lista.add(tempWidget);
//     lista.add(Divider());
//   }
//   return lista;
// }

List<Widget> _crearItemsCorta() {
  return opciones.map( ( item ) {
    return Column(
      children: [
        ListTile(
          title: Text(item),
          subtitle: Text("Cualquier cosaaaa"),
          leading: Icon(Icons.android),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){},
        ),
        Divider(),
      ],
    );
  }).toList();
  }
}
