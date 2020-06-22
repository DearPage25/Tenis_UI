import 'package:flutter/material.dart';
class BotonCompra extends StatelessWidget {
  final String texto;
  final double alto;
  final double ancho;
  final bool comprarahora;
  final Color color;

  const BotonCompra({
    @required this.texto, 
    this.alto = 50, 
    this.ancho = 150, 
    this.comprarahora = false, 
    this.color = Colors.orange,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text('$texto', style: TextStyle( color: Colors.white, fontSize: (this.comprarahora) ? 14 : 18, fontWeight: FontWeight.bold),),
      
    );
  }
}