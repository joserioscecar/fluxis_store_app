import 'package:flutter/material.dart';
import 'package:fluxis_store_app/screens/filtrar_producto_screen.dart';
import 'package:fluxis_store_app/screens/registrar_producto_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: FiltrarProductoScreen(),
    );
  }
}


