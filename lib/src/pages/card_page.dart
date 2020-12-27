import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el título de esta tarjeta"),
            subtitle: Text("Descripción de la tarjeta de la reverga."),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: null, 
                child: Text("Cancelar")
              ),
                
              FlatButton(
                onPressed: null, 
                child: Text("Aceptar")
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"), 
            image: NetworkImage("https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
            ),

          // Image(
          //   image: NetworkImage("https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg"),
          // ),
          
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Tremendo paisaje")
            ),
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
            )
        ]
        // color: Colors.red
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      
    );
  }
}