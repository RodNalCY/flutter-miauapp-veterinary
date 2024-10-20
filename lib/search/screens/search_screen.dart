import 'package:flutter/material.dart';
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
          ),
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
