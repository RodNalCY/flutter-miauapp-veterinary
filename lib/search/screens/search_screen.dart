import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/widgets/actions_widget.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text(
          "Buscar",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
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
      body: ListView(
        children: [
          buildServiceTile(
            imagePath: 'assets/background-login-1.jpg',
            title: 'Baño',
            postCount: 120,
            alignment: Alignment.centerLeft,
          ),
          buildServiceTile(
            imagePath: 'assets/background-login-2.jpg',
            title: 'Baño y Corte',
            postCount: 233,
            alignment: Alignment.centerRight,
          ),
          buildServiceTile(
            imagePath: 'assets/background-login-3.jpg',
            title: 'Deslanado',
            postCount: 89,
            alignment: Alignment.centerLeft,
          ),
          buildServiceTile(
            imagePath: 'assets/background-login-4.jpg',
            title: 'Stripping',
            postCount: 235,
            alignment: Alignment.centerRight,
          ),
          buildServiceTile(
            imagePath: 'assets/background-login-1.jpg',
            title: 'Colorimetría',
            postCount: 479,
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }

  Widget buildServiceTile({
    required String imagePath,
    required String title,
    required int postCount,
    required Alignment alignment,
  }) {
    bool isRightAligned = alignment == Alignment.centerRight;

    return Stack(
      children: [
        // Imagen de fondo
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Superposición de texto
        Positioned(
          top: 20,
          right: isRightAligned ? 20 : null, // Si está alineado a la derecha
          left: isRightAligned ? null : 20, // Si está alineado a la izquierda
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
        // Superposición de Posts
        Positioned(
          bottom: 20,
          right: isRightAligned ? 20 : null, // Si está alineado a la derecha
          left: isRightAligned ? null : 20, // Si está alineado a la izquierda
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$postCount Posts',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
