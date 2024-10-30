import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';
import 'package:miauapp_flutter_app/socio/screen/pedido_screen.dart';
import 'package:miauapp_flutter_app/widgets/loading_dialog_widget.dart';

const MAPBOX_ACCESS_TOKEN =
    "pk.eyJ1Ijoicm9kbmFsIiwiYSI6ImNtMmx3aHUyNTBoYWkybHB2cTdvZ2p4a3oifQ.TjBnXTGuCaJwJV_hQWUmxQ";
const MAPBOX_STYLE = "mapbox/streets-v12";
const MARKER_COLOR = Colors.blue;

const MARKER_SIZE_EXPANDED = 50.0;
const MARKER_SIZE_SHRINKED = 40.0;

class PublicServiceScreen extends StatefulWidget {
  late User user;
  PublicServiceScreen({super.key, required this.user});

  @override
  State<PublicServiceScreen> createState() => _PublicServiceScreenState();
}

class _PublicServiceScreenState extends State<PublicServiceScreen>
    with SingleTickerProviderStateMixin {
  ImageProvider imgBackground =
      const AssetImage('assets/background-login-9.jpg');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  late final AnimationController _animationController;
  late final LatLng _myLocation;
  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user.email;
    _nameController.text = widget.user.name;
    _telefonoController.text = widget.user.telefono;
    _precioController.text = "";

    _myLocation = LatLng(-12.118478, -77.032555);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _telefonoController.dispose();
    _precioController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(
        user: widget.user,
      ),
      appBar: AppBar(
        title: const Text(
          "Publicar",
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imgBackground, // Ruta de tu imagen
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), // Color y opacidad del filtro
              BlendMode.darken, // Modo de mezcla (darken en este caso)
            ),
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        // color: Colors.white38,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "NOMBRE",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(
                                                0.8), // Fondo negro opaco para el campo de texto
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: TextFormField(
                                            controller: _nameController,
                                            enabled: false,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Container(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: const Text(
                                      //     "CORREO",
                                      //     style: TextStyle(
                                      //       fontSize: 20,
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.w300,
                                      //     ),
                                      //   ),
                                      // ),
                                      // Align(
                                      //   alignment: Alignment.centerRight,
                                      //   child: Container(
                                      //     padding: const EdgeInsets.symmetric(
                                      //       horizontal: 12,
                                      //       vertical: 5,
                                      //     ),
                                      //     decoration: BoxDecoration(
                                      //       color: Colors.black.withOpacity(
                                      //           0.8), // Fondo negro opaco para el campo de texto
                                      //       borderRadius:
                                      //           BorderRadius.circular(3),
                                      //     ),
                                      //     child: TextFormField(
                                      //       controller: _emailController,
                                      //       enabled: false,
                                      //       style:
                                      //           TextStyle(color: Colors.white),
                                      //       decoration: InputDecoration(
                                      //         border: InputBorder.none,
                                      //         hintStyle: TextStyle(
                                      //           color: Colors.white
                                      //               .withOpacity(0.5),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "TELÉFONO",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      _telefonoController,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const IconButton(
                                                icon: Icon(Icons.smartphone,
                                                    color: Colors.white),
                                                onPressed: null,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "PRECIO",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: _precioController,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const IconButton(
                                                icon: Icon(Icons.paid,
                                                    color: Colors.white),
                                                onPressed: null,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "UBICACIÓN ACTUAL",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              25), // Ajusta el valor para la redondez
                                          child: FlutterMap(
                                            options: MapOptions(
                                              minZoom: 17,
                                              maxZoom: 17,
                                              initialZoom: 17,
                                              initialCenter: _myLocation,
                                            ),
                                            children: [
                                              TileLayer(
                                                urlTemplate:
                                                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                                                additionalOptions: {
                                                  'accessToken':
                                                      MAPBOX_ACCESS_TOKEN,
                                                  'id': MAPBOX_STYLE,
                                                },
                                              ),
                                              MarkerLayer(
                                                markers: [
                                                  Marker(
                                                    point: _myLocation,
                                                    child: _MyLocationMarker(
                                                        _animationController),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              Colors.white.withOpacity(0.7),
                                          backgroundColor: Colors.black,
                                          minimumSize: const Size(
                                            double.infinity,
                                            50,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          await publicarServicio();
                                        },
                                        child: const Text(
                                          'Publicar',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> publicarServicio() async {
    if (_nameController.text != "" &&
        _telefonoController.text != "" &&
        _precioController.text != "") {
      await LoadingDialogWidget.show(context: context, seconds: 3);

      onSuccess();

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PedidoScreen(
      //       user: widget.user,
      //     ),
      //   ),
      // );
    } else {
      onInputEmpty();
    }
  }

  void onSuccess() {
    Flushbar(
      // title: 'Hey Ninja',
      message:
          '¡Perfecto! Tu solicitud ha sido y enviada . Gracias por formar parte de Pet Call.',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        Icons.forward_to_inbox,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
    ).show(context);
  }

  void onInputEmpty() {
    Flushbar(
      // title: 'Hey Ninja',
      message:
          'Por favor, ingrese los datos de teléfono y precio en el formulario.',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        Icons.forward_to_inbox,
        color: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 219, 167, 22),
    ).show(context);
  }
}

class _MyLocationMarker extends AnimatedWidget {
  const _MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(.5, 1.0, value)!;
    final size = 40.0;
    // TODO: implement build
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: size * newValue,
              width: size * newValue,
              decoration: BoxDecoration(
                color: MARKER_COLOR.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: MARKER_COLOR,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
