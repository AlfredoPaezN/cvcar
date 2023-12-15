class Vehicle {
  String color;
  String marca;
  String tipoCombustible;
  String linea;
  String transito;
  String numeroChasis;
  String tipoServicio;
  String modelo;
  String clase;
  String cilindraje;
  String numeroMotor;

  Vehicle({
    required this.color,
    required this.marca,
    required this.tipoCombustible,
    required this.linea,
    required this.transito,
    required this.numeroChasis,
    required this.tipoServicio,
    required this.modelo,
    required this.clase,
    required this.cilindraje,
    required this.numeroMotor,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      color: json['Color'] ?? '',
      marca: json['Marca'] ?? '',
      tipoCombustible: json['Tipo de combustible'] ?? '',
      linea: json['Línea'] ?? '',
      transito: json['Transito'] ?? '',
      numeroChasis: json['# de chasis'] ?? '',
      tipoServicio: json['Tipo de servicio'] ?? '',
      modelo: json['Modelo'] ?? '',
      clase: json['Clase'] ?? '',
      cilindraje: json['Cilíndraje'] ?? '',
      numeroMotor: json['# de motor'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Color': color,
      'Marca': marca,
      'Tipo de combustible': tipoCombustible,
      'Línea': linea,
      'Transito': transito,
      '# de chasis': numeroChasis,
      'Tipo de servicio': tipoServicio,
      'Modelo': modelo,
      'Clase': clase,
      'Cilíndraje': cilindraje,
      '# de motor': numeroMotor,
    };
  }
}
