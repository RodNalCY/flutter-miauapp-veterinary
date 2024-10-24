import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/widgets/actions_widget.dart';
import 'package:miauapp_flutter_app/login/controller/database_helper.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';

class HomeScreen extends StatefulWidget {
  late User user;
  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print(widget.user.name);
    print(widget.user.password);
    print(widget.user.email);
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
          "Home",
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
            // Container for the header with white background
            Container(
              color: Colors.white, // White background
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  '¿Qué servicio deseas hoy?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  'Resultados',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Text and Map Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Peluqueros cerca de tu domicilio. Haz clic abajo para ver el más cercano a ti.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),

                  // Image for the map
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/map-lima.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ],
                  ),
                  // Address information

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      Text(
                        'Jiron las flores 257 - San Isidro',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 25),
                      Text(
                        '¿A donde desea el servicio? ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // Buttons for Reservar and Enviar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        // Handle reservation
                      },
                    ),
                    Text(
                      "Reservar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.local_shipping,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        // Handle reservation
                      },
                    ),
                    Text(
                      "Enviar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
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
