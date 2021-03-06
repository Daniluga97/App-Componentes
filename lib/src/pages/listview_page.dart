import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  
  ScrollController _scrollController = ScrollController();

  List<int> _numList = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      print("Scroll!!");
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Página de Listas")
       ),
       body: Stack(
         children: [
           _crearLista(),
           _crearLoading()
         ],
       )

    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numList.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _numList[index];
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/500/300/?image=$imagen"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _agregar10(){
    setState(() {
      for(int i = 1; i<10; i++){
      _ultimoItem++;
      _numList.add(_ultimoItem);
    }
    });
  }

  Future fetchData() async{
    _isLoading = true;
    setState(() {});
      final duration = Duration(seconds: 2);
      return Timer(duration, callbackHTTP);
  }

  void callbackHTTP(){

    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels+100, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _crearLoading() {

    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 30.0)
        ],
      );
    } else {
      return Container();
    }

  }

  Future<Null> obtenerPagina1() async {

    final duration = Duration(seconds: 2);
    Timer(duration, (){
      _numList.clear();
      _ultimoItem++;
      _agregar10();
    });
    
    return Future.delayed(duration);
  }




}