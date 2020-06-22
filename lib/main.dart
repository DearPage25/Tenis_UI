import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zapatos_app/src/models/zapato_model.dart';

//Routes
import 'package:zapatos_app/src/pages/home_page.dart';
import 'package:zapatos_app/src/pages/descripcion_page.dart';
 
void main() { 
  
  //para poner trasparente la barra de notificaciones
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
    )
  );
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ZapatoModel())
    ],
    child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'ZapatosApp',
      home: HomePage()
      // home: DescPage(),
    );
  }
}