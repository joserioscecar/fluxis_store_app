import 'package:flutter/material.dart';
import 'package:fluxis_store_app/models/producto.dart';

class DetalleProductosScreen extends StatelessWidget {
  final Producto _producto;
  const DetalleProductosScreen({super.key, required this._producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle de producto")),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SKU: ${_producto.sku}'),
            Text('Descripción: ${_producto.descripcion}'),
            Text('Precio: ${_producto.precio}'),
            Text('Stock: ${_producto.stock}'),
          ],
        ),
      ),
    );
  }
}
