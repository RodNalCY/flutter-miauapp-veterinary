class Cliente {
  int? id;
  String name;
  String email;
  String ubicacion;
  String referencia;
  String telefono;
  double latitud;
  double longitud;

  Cliente({
    this.id,
    required this.name,
    required this.email,
    required this.ubicacion,
    required this.referencia,
    required this.telefono,
    required this.latitud,
    required this.longitud,
  });

  // Convertir un objeto Cliente a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'ubicacion': ubicacion,
      'referencia': referencia,
      'telefono': telefono,
      'latitud': latitud,
      'longitud': longitud,
    };
  }

  // Crear un objeto Cliente desde un Map
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      ubicacion: map['ubicacion'],
      referencia: map['referencia'],
      telefono: map['telefono'],
      latitud: map['latitud'],
      longitud: map['longitud'],
    );
  }
}
