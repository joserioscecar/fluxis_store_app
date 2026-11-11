import 'dart:convert';
import 'dart:io';

import 'package:fluxis_store_app/models/filtrar_productos_request.dart';
import 'package:fluxis_store_app/models/crear_producto_request.dart';
import 'package:http/http.dart' as http;

class ProductoService {
  final String baseUrl = 'https://fluxisstore.apis.fluxis.co/';

  Future<bool> registrarProducto(CrearProductoRequest request) async {
    final json = jsonEncode(request.toJson());

    final respuesta = await http.post(
      headers: {'Content-type': "Application/json"},
      Uri.parse('$baseUrl/productos'),
      body: json,
    );

    return respuesta.statusCode == HttpStatus.created;
  }

  Future<FiltrarProductosRequest?> filtrar({String? descripcion}) async {
    final queryParams = <String, String>{};

    if (descripcion != null && descripcion.trim().isNotEmpty) {
      queryParams['descripcion'] = descripcion.trim();
    }

    final uri = Uri.parse('$baseUrl/productos')
        .replace(queryParameters: queryParams);

    final respuesta = await http.get(uri);

    if (respuesta.statusCode == HttpStatus.ok) {
      final json = jsonDecode(respuesta.body);
      return FiltrarProductosRequest.fromJson(json);
    }

    return null;
  }

    Future<FiltrarProductosRequest?> listar() async {


    final respuesta = await http.get(Uri.parse('$baseUrl/productos'));

    if (respuesta.statusCode == HttpStatus.ok) {
      final json = jsonDecode(respuesta.body);
      return FiltrarProductosRequest.fromJson(json);
    }

    return null;
  }
}




