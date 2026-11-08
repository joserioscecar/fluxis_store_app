class CrearProductoRequest {
  final String descripcion;
  final double precio;
  final int stock;

  const CrearProductoRequest({
    required this.descripcion,
    required this.precio,
    required this.stock,
  });

  Map<String, dynamic> toJson() => {
    'descripcion': descripcion,
    'precio': precio,
    'stock': stock,
  };
}
