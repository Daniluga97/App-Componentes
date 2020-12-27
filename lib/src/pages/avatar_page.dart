import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de avatares"),
        actions: [
          Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://pbs.twimg.com/media/Dr0vHeDVYAAy2sx.jpg"),
              radius: 25.0,
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(right: 10.0) ,
            child: CircleAvatar(
              child: Text("DL"),
              backgroundColor: Colors.deepPurple,
          ),
        )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"), 
          image: NetworkImage("https://hipertextual.com/files/2017/10/stan-lee-hero.jpg?width=1200&enable=upscale"),
          fadeInDuration: Duration(milliseconds: 200),
        )
        
      )
    );
  }
}