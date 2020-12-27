import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = "";
  String _email = "";
  String _pass = "";
  String _fecha = "";
  String _optSeleccionada = "-- Seleccionar --";

  List _poderes = ["-- Seleccionar --", "Impactrueno", "Placaje Eléctrico", "Trueno"];
 
  TextEditingController _inputFecha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de inputs")
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
       //child: child,
    );
  }

  Widget _crearInput() {    
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Escribe tu nombre",
        labelText: "Nombre",
        helperText: "Esto es tu nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
          print(_nombre);
        });
      },
    );
  }

 Widget _crearPersona() {
   return ListTile(
     title: Text("El nombre es: $_nombre"),
     subtitle: Text("Correo electrónico: $_email"),
     trailing: Text("$_optSeleccionada"),
   );
 }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Escribe tu correo electrónico",
        labelText: "Correo electrónico",
        helperText: "Esto es tu correo electrónico",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
          print(_email);
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Escribe tu contraseña",
        labelText: "Contraseña",
        helperText: "Esta es tu contraseña",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onChanged: (valor){
        setState(() {
          _pass = valor;
          print(_pass);
        });
    },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFecha,
      decoration: InputDecoration(
        hintText: "Selecciona la fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        helperText: "Esta es tu fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);

      },
    );
  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime.now(),
      helpText: "SELECCIONA LA FECHA",
      locale: Locale("es","ES")
    );
    if(picked != null){
      setState(() {
        final _formatDate = DateFormat("dd/MM/yyyy");
        _fecha = _formatDate.format(picked);        
        _inputFecha.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptDropdown(){
    List<DropdownMenuItem<String>> lista = List();
    _poderes.forEach((i) {
      lista.add(DropdownMenuItem(
        child: Text(i),
        value: i,
        ));
     });
     return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _optSeleccionada,
          items: getOptDropdown(), 
          onChanged: (i){
            setState(() {
              _optSeleccionada = i;
            });
          }
        )
      ],
    );
  } 
}