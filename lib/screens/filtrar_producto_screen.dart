import 'package:flutter/material.dart';
import 'package:fluxis_store_app/models/filtrar_productos_request.dart';
import 'package:fluxis_store_app/screens/detalle_productos_screen.dart';
import 'package:fluxis_store_app/screens/registrar_producto_screen.dart';
import 'package:fluxis_store_app/services/producto_service.dart';

class FiltrarProductoScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FiltrarProductoScreen> createState() => _FiltrarProductoScreenState();
}

class _FiltrarProductoScreenState extends State<FiltrarProductoScreen> {
  final ProductoService _productoService = ProductoService();
  late Future<FiltrarProductosRequest?> _consulta;
  late final TextEditingController _busquedaController;

  @override
  void initState() {
    super.initState();
    _busquedaController = TextEditingController();
    _consulta = _productoService.filtrar();
  }

  @override
  void dispose() {
    _busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listado de productos")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RegistrarProductoScreen()),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _busquedaController,
                    decoration: InputDecoration(labelText: 'Filtrar'),
                  ),
                ),
                IconButton(onPressed: _buscar, icon: const Icon(Icons.search)),
              ],
            ),
            Expanded(
              child: FutureBuilder<FiltrarProductosRequest?>(
                future: _consulta,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error al cargar los productos'),
                    );
                  }

                  final productos = snapshot.data?.data ?? [];

                  if (productos.isEmpty) {
                    return const Center(child: Text('No hay productos'));
                  }

                  return ListView.separated(
                    itemCount: productos.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final producto = productos[index];

                      return ListTile(
                        key: ValueKey(producto.sku),
                        title: Text(producto.descripcion),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetalleProductosScreen(producto: producto),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _buscar() {
    setState(() {
      _consulta = _productoService.filtrar(
        descripcion: _busquedaController.text,
      );
    });
  }
}
