import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';
import 'package:miauapp_flutter_app/socio/controller/cliente_helper.dart';
import 'package:miauapp_flutter_app/socio/model/cliente.dart';
import 'package:miauapp_flutter_app/socio/screen/pedido_detail_screen.dart';

class PedidoScreen extends StatefulWidget {
  late User user;
  PedidoScreen({super.key, required this.user});

  @override
  State<PedidoScreen> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {
  final ClienteHelper _clienteHelper = ClienteHelper();

  List<Cliente> _cliente = [];
  Future<void> _loadData() async {
    final List<Cliente> clientes = await _clienteHelper.getClientes();
    setState(() {
      _cliente = clientes;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideMenu(
        user: widget.user,
      ),
      appBar: AppBar(
        title: const Text(
          "Clientes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[900],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: _cliente.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('assets/logo-no-disponible-2.jpg'),
                      height: 130,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Aún no existen pedidos disponibles !",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _cliente.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ), // Márgenes alrededor de la tarjeta
                  elevation: 4, // Añade sombra para resaltar la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Bordes redondeados
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_pin, // Ícono de usuario
                      color: Colors.black, // Color del ícono
                      size: 40, // Tamaño del ícono
                    ),
                    title: Text(
                      _cliente[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold), // Resaltar el nombre
                    ),
                    subtitle: Text(
                      _cliente[index].direccion,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.grey), // Flecha a la derecha
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PedidoDetailScreen(
                            cliente: _cliente[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
