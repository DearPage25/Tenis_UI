import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:zapatos_app/src/components/widgets/1exports_widgets.dart';
import 'package:zapatos_app/src/helpers/helpers_statusbar.dart';
import 'package:zapatos_app/src/models/zapato_model.dart';


class DescPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Stack(
          //   children: <Widget>[
          //     Positioned(
          //       child: FloatingActionButton(
          //         child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
          //         backgroundColor: Colors.transparent,
          //         onPressed: (){}),)
          //   ],
          // ),
          Expanded(child: 
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: <Widget>[
                  
                  Column(
                    children: <Widget>[
                      
                      Hero(
                        tag: 'zapato-1',
                        child: ZapatoSizePreview(fullScreen : true)
                      ),
                      ZapatoDescripcion(
                        titulo: 'Nike Air Max 720',
                        descripcion:"The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),

                      BotonComprarAhora(),
                      _ColoresyMas(),
                    
                      _BottomBar()
                    ],
                  ),
                  Positioned(
                    top: 50,
                    child: FadeIn(
                      duration: Duration( microseconds: 800),
                      child: FloatingActionButton(
                        child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                        backgroundColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        elevation: 0,
                        highlightElevation: 0,
                        onPressed: (){
                          cambiarStatusDark();
                          Navigator.pop(context);
                        }
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
      
    );
  }
}

class _BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _Boton( Icon( Icons.favorite, color: Colors.red, size: 25,)),
          _Boton( Icon( Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _Boton( Icon( Icons.share, color: Colors.grey.withOpacity(0.4), size: 25,)),
        ],
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  final Icon icon;
  const _Boton(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow( color: Colors.black26, spreadRadius: -5, blurRadius: 20, offset: Offset( 0, 10) )
        ]
      ),
      
      child: icon,
    );
  }
}

class _ColoresyMas extends StatelessWidget {
  // const _ColoresyMas({});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[

          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(left: 90, child:_BontonColor( Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 60, child:_BontonColor( Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png' )),
                Positioned(left: 30, child:_BontonColor( Color(0xff2099F1), 2, 'assets/imgs/azul.png' )),
                _BontonColor( Color(0xff364D56), 1,  'assets/imgs/negro.png' ),
              ],
            )
          ),
          // Spacer(),

          BotonCompra(texto: 'Saber Más Sobre', alto: 30, ancho: 170, color: Color(0xffFFC675), comprarahora: true,)

        ],
      ),
    );
  }
}

class _BontonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlColor; 
  const _BontonColor(
    this.color,
    this.index,
    this.urlColor,
  );

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration( milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: (){
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlColor;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class BotonComprarAhora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Text('\$190.0', style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonCompra(texto: 'Comprar Ahora', ancho: 120, alto: 40, comprarahora: true)),
          ],
        ),
      ),
    );
    
  }
}

