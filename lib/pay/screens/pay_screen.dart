import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/widgets/actions_widget.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';

class PayScreen extends StatefulWidget {
  late User user;
  PayScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  void initState() {
    super.initState();
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
          "Mi Pagos",
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
        actions: [
          ActionsWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección superior de bienvenida
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Hola, ${widget.user.name}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Bienvenido",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tarjeta de crédito o débito
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tarjeta de crédito o débito',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/chip-logo.png"),
                              width: 40,
                            ),
                            Text(
                              '4557-9956-632-8412',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Válido\n12/26',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Image(
                              image: AssetImage("assets/card-logo.png"),
                              width: 65,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Sección de Servicios
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Servicios / Groomer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mas recientes',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Lista de servicios
                  ServiceTile(
                    service: 'Baño y Corte',
                    name: 'Luis Rosales',
                    price: '90.00',
                    iconColor: Colors.green,
                  ),
                  ServiceTile(
                    service: 'Baño',
                    name: 'Juan Yunque',
                    price: '40.00',
                    iconColor: Colors.brown,
                  ),
                  ServiceTile(
                    service: 'Baño y Corte',
                    name: 'Lucio Torres',
                    price: '85.00',
                    iconColor: Colors.green,
                  ),
                  ServiceTile(
                    service: 'Baño y Corte',
                    name: 'Lucio Torres',
                    price: '90.00',
                    iconColor: Colors.green,
                  ),
                  ServiceTile(
                    service: 'Corte de Uñas',
                    name: 'María Pérez',
                    price: '30.00',
                    iconColor: Colors.purple,
                  ),
                  ServiceTile(
                    service: 'Baño Completo',
                    name: 'Carlos Sánchez',
                    price: '70.00',
                    iconColor: Colors.blue,
                  ),
                  ServiceTile(
                    service: 'Desparasitación',
                    name: 'Ana Fernández',
                    price: '50.00',
                    iconColor: Colors.red,
                  ),
                  ServiceTile(
                    service: 'Baño y Corte',
                    name: 'Juan Martínez',
                    price: '85.00',
                    iconColor: Colors.green,
                  ),
                  ServiceTile(
                    service: 'Corte de Pelo',
                    name: 'Luis Jiménez',
                    price: '45.00',
                    iconColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ServiceTile({
    required service,
    required name,
    required price,
    required iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Icono del servicio
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor,
            child: Icon(
              Icons.pets,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 12),
          // Información del servicio
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Precio del servicio
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Se envio el codigo de verificación a su correo."),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
