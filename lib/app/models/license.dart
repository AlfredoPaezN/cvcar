class License {
  final String nombre;
  final String numeroLicencia;
  final String categoria;
  final String fechaExpedicion;
  final String fechaVencimiento;

  License({
    required this.nombre,
    required this.numeroLicencia,
    required this.categoria,
    required this.fechaExpedicion,
    required this.fechaVencimiento,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      nombre: json['Nombre'] ?? '',
      numeroLicencia: json['No de licencia'] ?? '',
      categoria: json['Categoría'] ?? '',
      fechaExpedicion: json['Fecha de expedición'] ?? '',
      fechaVencimiento: json['Fecha de vencimiento'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Nombre': nombre,
      'No de licencia': numeroLicencia,
      'Categoría': categoria,
      'Fecha de expedición': fechaExpedicion,
      'Fecha de vencimiento': fechaVencimiento,
    };
  }
}
