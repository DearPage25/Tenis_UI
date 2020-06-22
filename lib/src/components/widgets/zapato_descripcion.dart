import 'package:flutter/material.dart';


class ZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ZapatoDescripcion({
    @required this.titulo,
    @required this.descripcion
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('$titulo', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          SizedBox(height: 20),
          Text('$descripcion', style: TextStyle(color: Colors.grey, height: 1.6),),

        ],
      ),
      
    );
  }
}