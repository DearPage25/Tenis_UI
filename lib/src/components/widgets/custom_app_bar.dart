import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String texto;
  CustomAppBar({
    @required this.texto
    
  });
  
  @override
  Widget build(BuildContext context) {
    
    //Estilo de Texto
      //Barra de Busqueda
    final searchBar = TextStyle( fontSize: 30, fontWeight: FontWeight.w700);
  
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Text(this.texto, style: searchBar),
              Spacer(),
              Icon( Icons.search, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}