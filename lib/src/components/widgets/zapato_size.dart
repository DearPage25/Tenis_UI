import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos_app/src/models/zapato_model.dart';
import 'package:zapatos_app/src/pages/descripcion_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({this.fullScreen = false}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!fullScreen){
          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DescPage()));
        }
      },
        child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30, 
          vertical: (fullScreen) ? 5 : 0),
        child: Container(
          height: (fullScreen)? 410 :450,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: 
              (!fullScreen) 
                ? BorderRadius.circular(50)
                : BorderRadius.only(  
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              // color: Color(0xffF8D468)
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xffFFCF53),
                Color(0xffF8D468),
                Colors.orangeAccent
              ]
            )
          ),
          child: Column(
            children: <Widget>[
              _ImgZapato(),
              if(!fullScreen)
                _ZapatoSizes()
            ],
          ),
        ),
      ),
    );
  }
}
class _ZapatoSizes extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _BoxSize(7),
          _BoxSize(7.5),
          _BoxSize(8),
          _BoxSize(8.5),
          _BoxSize(9),
          _BoxSize(9.5),

        ],
      ),
    );
  }
}

class _BoxSize extends StatelessWidget {
  final double numero;

  const _BoxSize(
    this.numero
  );

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: (){
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}', style: TextStyle(
          color: (numero == zapatoModel.talla)? Colors.white : Colors.orange,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
       
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: ( numero == zapatoModel.talla ) ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow> [
            if(numero == zapatoModel.talla)
              BoxShadow(color: Colors.orange, blurRadius: 10, offset: Offset(0, 5))
          ]
        ),
        
      ),
    );
  }
}

class _ImgZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 5,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(image:  AssetImage(zapatoModel.assetImage),)
        ],
        
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.3,
      child: Container(
        height: 120,
        width: 230,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow:<BoxShadow> [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
        
      ),
    );
  }
}
