import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/screens/home_screen.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/map/screen/animated_markers_map.dart';
import 'package:miauapp_flutter_app/pay/screens/pay_screen.dart';
import 'package:miauapp_flutter_app/profile/screens/perfil_screen.dart';
import 'package:miauapp_flutter_app/search/screens/search_screen.dart';
import 'package:miauapp_flutter_app/socio/screen/pedido_screen.dart';

class FabTabMenu extends StatefulWidget {
  late int selectedIndex;
  late User user;
  FabTabMenu({super.key, required this.selectedIndex, required this.user});

  @override
  State<FabTabMenu> createState() => _FabTabMenuState();
}

class _FabTabMenuState extends State<FabTabMenu> {
  int currentIndex = 0;
  late final List<Widget> pages;

  final PageStorageBucket bucket = PageStorageBucket();
  Color color_active = Colors.black;
  Color color_inactive = Colors.grey;

  void onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    onItemTapped(widget.selectedIndex);
    pages = [
      HomeScreen(user: widget.user),
      PayScreen(user: widget.user),
      SearchScreen(user: widget.user),
      PerfilScreen(user: widget.user),
      AnimatedMarkersMap(user: widget.user),
      PedidoScreen(user: widget.user),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? HomeScreen(
            user: widget.user,
          )
        : currentIndex == 1
            ? PayScreen(user: widget.user)
            : currentIndex == 2
                ? SearchScreen(user: widget.user)
                : currentIndex == 3
                    ? PerfilScreen(user: widget.user)
                    : currentIndex == 4
                        ? AnimatedMarkersMap(user: widget.user)
                        : PedidoScreen(user: widget.user);
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.user.role == "user") {
            setState(() {
              currentScreen = AnimatedMarkersMap(user: widget.user);
              currentIndex = 4;
            });
          } else if (widget.user.role == "socio") {
            setState(() {
              currentScreen = PedidoScreen(user: widget.user);
              currentIndex = 5;
            });
          }
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          widget.user.role == "user" ? Icons.travel_explore : Icons.diversity_3,
          color: currentIndex == 4 || currentIndex == 5
              ? color_active
              : color_inactive,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen(
                          user: widget.user,
                        );
                        currentIndex = 0;
                      });
                    },
                    minWidth: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: currentIndex == 0 ? 30 : 25,
                          Icons.home_filled,
                          color:
                              currentIndex == 0 ? color_active : color_inactive,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: currentIndex == 0
                                ? color_active
                                : color_inactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = PayScreen(user: widget.user);
                        currentIndex = 1;
                      });
                    },
                    minWidth: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: currentIndex == 1 ? 30 : 25,
                          Icons.payment,
                          color:
                              currentIndex == 1 ? color_active : color_inactive,
                        ),
                        Text(
                          "Pagos",
                          style: TextStyle(
                            color: currentIndex == 1
                                ? color_active
                                : color_inactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = SearchScreen(user: widget.user);
                        currentIndex = 2;
                      });
                    },
                    minWidth: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: currentIndex == 2 ? 30 : 25,
                          Icons.search,
                          color:
                              currentIndex == 2 ? color_active : color_inactive,
                        ),
                        Text(
                          "Buscar",
                          style: TextStyle(
                            color: currentIndex == 2
                                ? color_active
                                : color_inactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = PerfilScreen(user: widget.user);
                        currentIndex = 3;
                      });
                    },
                    minWidth: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: currentIndex == 3 ? 30 : 25,
                          Icons.person,
                          color:
                              currentIndex == 3 ? color_active : color_inactive,
                        ),
                        Text(
                          "Perfil",
                          style: TextStyle(
                            color: currentIndex == 3
                                ? color_active
                                : color_inactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
