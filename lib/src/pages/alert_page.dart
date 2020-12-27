import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de alertas")
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _mostrarAlerta(context),
          child:Text("Mostrar alerta"),
          color: Colors.red,
          textColor: Colors.white,
          shape: StadiumBorder(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.android),
        onPressed: (){
          Navigator.pop(context);
        } 
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      // barrierColor: Colors.blue,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: Text("Título de la alerta"),
        // content: Text("Mensaje de la alerta"),
        content: Column(
          children: [
            Text("Este es el contenido de la caja de alerta"),
            FlutterLogo(size: 100,colors: Colors.pink,)
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      actions: [
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          },  
          child: Text("Cancelar")
        ),
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          },   
          child: Text("Aceptar")
        )
      ],
      ),
    );
  }


}