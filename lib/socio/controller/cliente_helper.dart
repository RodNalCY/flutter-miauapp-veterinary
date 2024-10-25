import 'package:miauapp_flutter_app/socio/model/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClienteHelper {
  static final ClienteHelper _instance = ClienteHelper._internal();
  static Database? _database;

  factory ClienteHelper() {
    return _instance;
  }

  ClienteHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'cliente_database.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        direccion TEXT,
        referencia TEXT,
        telefono TEXT,
        latitud REAL,
        longitud REAL
      )
    ''');
  }

  Future<void> insertUser(Cliente cliente) async {
    final db = await database;
    await db.insert(
      'clientes',
      cliente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('clientes');
    return List.generate(maps.length, (i) {
      return Cliente(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        direccion: maps[i]['direccion'],
        referencia: maps[i]['referencia'],
        telefono: maps[i]['telefono'],
        latitud: maps[i]['latitud'],
        longitud: maps[i]['longitud'],
      );
    });
  }
}
