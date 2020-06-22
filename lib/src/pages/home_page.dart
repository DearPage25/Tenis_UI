import 'package:flutter/material.dart';
import 'package:zapatos_app/src/components/widgets/1exports_widgets.dart';
import 'package:zapatos_app/src/helpers/helpers_statusbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      // body: CustomAppBar(texto: 'Para Ti!',)
      // body: ZapatoSizePreview(),
      body: Column(
        children: <Widget>[
          CustomAppBar(
            texto: 'Para Ti!',
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview()
                  ),
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            ),
          ),
          BottomCarrito(monto: 190.0)
        ],
      ),
    );
  }
}
