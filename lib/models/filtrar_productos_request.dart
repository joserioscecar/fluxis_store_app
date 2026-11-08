import 'package:fluxis_store_app/models/producto.dart';

class FiltrarProductosRequest {
  final List<Producto> data;

  const FiltrarProductosRequest({required this.data});

  @override
  String toString() => 'FiltrarProductosRequest(data: $data)';

  factory FiltrarProductosRequest.fromJson(Map<String, dynamic> json) =>
      FiltrarProductosRequest(
        data: (json['data'] as List<dynamic>)
            .map((item) => Producto.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
}
