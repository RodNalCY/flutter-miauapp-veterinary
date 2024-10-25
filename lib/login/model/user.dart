class User {
  int? id;
  String name;
  String email;
  String password;
  String birthDate;
  String role;
  String file;
  String telefono;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.role,
    required this.file,
    required this.telefono,
  });

  // Convertir un objeto User a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'birthDate': birthDate,
      'role': role,
      'file': file,
      'telefono': telefono,
    };
  }

  // Crear un objeto User desde un Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      birthDate: map['birthDate'],
      role: map['role'],
      file: map['file'],
      telefono: map['telefono'],
    );
  }
}
