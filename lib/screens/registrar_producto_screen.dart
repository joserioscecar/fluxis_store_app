import 'package:flutter/material.dart';
import 'package:fluxis_store_app/models/crear_producto_request.dart';
import 'package:fluxis_store_app/services/producto_service.dart';

class RegistrarProductoScreen extends StatefulWidget {
  const RegistrarProductoScreen({super.key});

  @override
  State<RegistrarProductoScreen> createState() => _RegistrarProductoScreenState();
}

class _RegistrarProductoScreenState extends State<RegistrarProductoScreen> {
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final ProductoService _productoService = ProductoService();

  @override
  void dispose() {
    _descripcionController.dispose();
    _precioController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro de Productos")),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 80,
          bottom: 100,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Descripción"),
              controller: _descripcionController,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Precio"),
              controller: _precioController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "stock"),
              controller: _stockController,
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: _onRegistrarProducto,
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRegistrarProducto() async {
    final precio = double.tryParse(_precioController.text);
    final stock = int.tryParse(_stockController.text);

    if (precio == null || stock == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa un precio y un stock válidos'),
        ),
      );
      return;
    }

    final CrearProductoRequest request = CrearProductoRequest(
      descripcion: _descripcionController.text,
      precio: precio,
      stock: stock,
    );

    final registrado = await _productoService.registrarProducto(request);

    if (!mounted) return;

    if (registrado) {
      _descripcionController.clear();
      _precioController.clear();
      _stockController.clear();
    }


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          registrado
              ? 'Producto registrado con éxito'
              : 'No se pudo registrar el producto',
        ),
      ),
    );
    
  }
}
