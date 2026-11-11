import 'package:flutter/material.dart';
import 'package:fluxis_store_app/models/producto.dart';

class DetalleProductosScreen extends StatelessWidget {
  final Producto producto;
  const DetalleProductosScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle de producto")),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SKU: ${producto.sku}'),
            Text('Descripción: ${producto.descripcion}'),
            Text('Precio: ${producto.precio}'),
            Text('Stock: ${producto.stock}'),
          ],
        ),
      ),
    );
  }
}
