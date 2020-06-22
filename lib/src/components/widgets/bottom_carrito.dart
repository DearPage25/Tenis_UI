import 'package:flutter/material.dart';
import 'package:zapatos_app/src/components/widgets/1exports_widgets.dart';

class  BottomCarrito extends StatelessWidget {
  final double monto;
  const  BottomCarrito({
    @required this.monto
  });
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10, vertical: 1),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color:Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20,),
            Text('\$$monto', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold ),),
            Spacer(),
            BotonCompra(texto: 'Comprar',),
            SizedBox(width: 10)
          ],
        ),
        
      ),
    );
  }
}