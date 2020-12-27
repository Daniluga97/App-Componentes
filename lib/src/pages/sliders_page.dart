import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de sliders")
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              ),
          ],
        ),
      )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: "Tamaño de la imagen",
      //divisions: 10,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck) ? null : (i){
        setState(() {
            print(i);
          _valorSlider = i;
        });
      }
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      image: AssetImage("assets/hackerman_1.jpg"),
      placeholder: AssetImage("assets/jar-loading.gif"),
      //fadeInDuration: Duration(seconds: 80),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck, 
    //   onChanged: (i){
    //     setState(() {
    //       _bloquearCheck = i;
    //       print(_bloquearCheck);
    //     });        
    //   }
    // );

    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck, 
      onChanged: (i){
        setState(() {
          _bloquearCheck = i;
          print(_bloquearCheck);
        });    
      }
    );
  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck, 
      onChanged: (i){
        setState(() {
          _bloquearCheck = i;
          print(_bloquearCheck);
        });    
      }
    );
  }
}