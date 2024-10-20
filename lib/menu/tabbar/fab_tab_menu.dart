import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/screens/home_screen.dart';
import 'package:miauapp_flutter_app/pay/screens/pay_screen.dart';
import 'package:miauapp_flutter_app/profile/screens/perfil_screen.dart';
import 'package:miauapp_flutter_app/search/screens/search_screen.dart';

class FabTabMenu extends StatefulWidget {
  late int selectedIndex;
  FabTabMenu({super.key, required this.selectedIndex});

  @override
  State<FabTabMenu> createState() => _FabTabMenuState();
}

class _FabTabMenuState extends State<FabTabMenu> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    PayScreen(),
    SearchScreen(),
    PerfilScreen(),
  ];

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0
        ? HomeScreen()
        : currentIndex == 1
            ? PayScreen()
            : currentIndex == 2
                ? SearchScreen()
                : PerfilScreen();
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentScreen = HomeScreen();
            currentIndex = 0;
          });
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
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
                        currentScreen = HomeScreen();
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
                        currentScreen = PayScreen();
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
                        currentScreen = SearchScreen();
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
                        currentScreen = PerfilScreen();
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