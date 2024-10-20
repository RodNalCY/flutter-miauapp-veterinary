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
          const DrawerHeader(
            child: const Text(
              'RODNAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1.0),
                  bottomRight: Radius.circular(1.0)),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/background-login-1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_filled,
              color: Colors.white70,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FabTabMenu(
                    selectedIndex: 0,
                  ),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.white70,
            ),
            title: const Text(
              "Pagos",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FabTabMenu(
                    selectedIndex: 1,
                  ),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.white70,
            ),
            title: Text(
              "Buscar",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FabTabMenu(
                    selectedIndex: 2,
                  ),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white70,
            ),
            title: Text(
              "Perfil",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => FabTabMenu(
                    selectedIndex: 3,
                  ),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
