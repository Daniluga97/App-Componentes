// import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicación de componentes"), 
      ),
      body: _lista(),
    );
   }

 Widget _lista() {
   //menuProvider.cargarData()
  return FutureBuilder(
    future: menuProvider.cargarData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
      return ListView(
        children: _listaItems(snapshot.data, context)
      );
    },
  );
}

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    
    final List<Widget> opciones = [];
    
    if(data == null){
      return [];
    }

    data.forEach((i) {
      final widgetTemp = ListTile(
        title: Text(i["texto"]),
        leading: getIcon(i["icon"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          Navigator.pushNamed(context, i["ruta"]);
        },
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });
    return opciones;
  }
}