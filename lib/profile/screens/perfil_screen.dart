import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/widgets/actions_widget.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';

class PerfilScreen extends StatefulWidget {
  late User user;

  PerfilScreen({super.key, required this.user});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
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
          "Perfil",
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: Colors.black87,
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 20),
                    child: Text(
                      "Perfil",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                ItemMenu(
                  context,
                  name: "Política de Privacidad",
                  icono: Icons.lock,
                  index: null,
                  onTap: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                ItemMenu(
                  context,
                  name: "Recomendar esta app",
                  icono: Icons.stars,
                  index: null,
                  onTap: () {},
                ),
                ItemMenu(
                  context,
                  name: "Compartir esta app",
                  icono: Icons.share,
                  index: null,
                  onTap: () {},
                ),
                SizedBox(
                  height: 285,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Column(
                    children: [
                      ItemMenu(
                        context,
                        name: "Mensajeria",
                        icono: Icons.maps_ugc,
                        index: null,
                        onTap: () {},
                      ),
                      ItemMenu(
                        context,
                        name: "Cerrar sesión",
                        icono: Icons.power_settings_new,
                        index: null,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget ItemMenu(
    BuildContext context, {
    required String name,
    required IconData icono,
    required int? index,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icono, // Se elimina 'const' ya que 'icono' es un parámetro
        color: Colors.white70,
        size: 35,
      ),
      trailing: const Icon(
        Icons.chevron_right, // Icono de flecha a la derecha
        color: Colors.white70,
      ),
      title: Text(
        name, // Se elimina 'const' ya que 'name' es un parámetro
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
