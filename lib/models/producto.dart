class Producto {
  final int sku;
  final String descripcion;
  final double precio;
  final int stock;

  const Producto({
    required this.sku,
    required this.descripcion,
    required this.precio,
    required this.stock,
  });

  @override
  String toString() =>
      'Producto(sku: $sku, descripcion: $descripcion, precio: $precio, stock: $stock)';

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    sku: json['sku'] as int,
    descripcion: json['descripcion'] as String,
    precio: json['precio'] as double,
    stock: json['stock'] as int,
  );
}
