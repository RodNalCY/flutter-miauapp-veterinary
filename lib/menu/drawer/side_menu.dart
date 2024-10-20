import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/screens/home_screen.dart';
import 'package:miauapp_flutter_app/menu/tabbar/fab_tab_menu.dart';
import 'package:miauapp_flutter_app/profile/screens/perfil_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // const DrawerHeader(
          //   child: const Text(
          //     'RODNAL',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 25,
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(1.0),
          //         bottomRight: Radius.circular(1.0)),
          //     color: Colors.white,
          //     image: DecorationImage(
          //       image: AssetImage('assets/background-login-1.jpg'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(),
          ItemMenu(context, name: "Tu cuenta", icono: Icons.person, index: 3),
          ItemMenu(context, name: "Home", icono: Icons.home_filled, index: 0),
          ItemMenu(context, name: "Pagos", icono: Icons.payment, index: 1),
          ItemMenu(context, name: "Buscar", icono: Icons.search, index: 2),
          ItemMenu(
            context,
            name: "Servicios",
            icono: Icons.info,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Ranking de Groomers",
            icono: Icons.workspace_premium,
            index: null,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                "Configuración General",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(),
          ItemMenu(
            context,
            name: "Actividad Reciente",
            icono: Icons.schedule,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Lenguaje",
            icono: Icons.language,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Acerca",
            icono: Icons.help,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Termino y condiciones",
            icono: Icons.notes,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Política de Privacidad",
            icono: Icons.lock,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Recomendar esta app",
            icono: Icons.stars,
            index: null,
          ),
          ItemMenu(
            context,
            name: "Compartir esta app",
            icono: Icons.share,
            index: null,
          ),
        ],
      ),
    );
  }

  Widget ItemMenu(BuildContext context,
      {required String name, required IconData icono, required int? index}) {
    return ListTile(
      leading: Icon(
        icono, // Se elimina 'const' ya que 'icono' es un parámetro
        color: Colors.white70,
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
      onTap: () => {
        // Valida que el índice no sea nulo antes de navegar

        if (index != null)
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FabTabMenu(
                  selectedIndex: index,
                ),
              ),
            ),
          }
      },
    );
  }
}
