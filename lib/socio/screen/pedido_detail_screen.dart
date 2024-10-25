import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:miauapp_flutter_app/socio/model/cliente.dart';

const MAPBOX_ACCESS_TOKEN =
    "pk.eyJ1Ijoicm9kbmFsIiwiYSI6ImNtMmx3aHUyNTBoYWkybHB2cTdvZ2p4a3oifQ.TjBnXTGuCaJwJV_hQWUmxQ";
const MAPBOX_STYLE = "mapbox/streets-v12";
const MARKER_COLOR = Colors.blue;
final _myLocation = LatLng(-12.121145, -77.030404);
const MARKER_SIZE_EXPANDED = 50.0;
const MARKER_SIZE_SHRINKED = 40.0;

class PedidoDetailScreen extends StatefulWidget {
  late Cliente cliente;
  PedidoDetailScreen({super.key, required this.cliente});

  @override
  State<PedidoDetailScreen> createState() => _PedidoDetailScreenState();
}

class _PedidoDetailScreenState extends State<PedidoDetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Detalle",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey[900],
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado del Card
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Text(
                        widget.cliente.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Detalles del Cliente en campos de solo lectura
                  // _buildDetailField(
                  //   icon: Icons.email,
                  //   label: 'Email',
                  //   value: widget.cliente.email,
                  // ),
                  _buildDetailField(
                    icon: Icons.location_on,
                    label: 'Ubicación',
                    value: widget.cliente.ubicacion,
                  ),
                  _buildDetailField(
                    icon: Icons.map,
                    label: 'Referencia',
                    value: widget.cliente.referencia,
                  ),
                  _buildDetailField(
                    icon: Icons.phone,
                    label: 'Teléfono',
                    value: widget.cliente.telefono,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailField(
                          icon: Icons.location_searching,
                          label: 'Latitud',
                          value: widget.cliente.latitud.toString(),
                        ),
                      ),
                      const SizedBox(width: 8), // Espaciado entre los campos
                      Expanded(
                        child: _buildDetailField(
                          icon: Icons.location_searching,
                          label: 'Longitud',
                          value: widget.cliente.longitud.toString(),
                        ),
                      ),
                    ],
                  ),
                  // Imagen en la parte inferior del Card
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          25), // Ajusta el valor para la redondez
                      child: FlutterMap(
                        options: MapOptions(
                          minZoom: 15,
                          maxZoom: 18,
                          initialZoom: 17,
                          initialCenter: _myLocation,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                            additionalOptions: {
                              'accessToken': MAPBOX_ACCESS_TOKEN,
                              'id': MAPBOX_STYLE,
                            },
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: _myLocation,
                                child: _MyLocationMarker(_animationController),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(0.7),
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
                      // await registerUser();
                      onSuccess(name: widget.cliente.name, context: context);
                    },
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // Widget helper para construir cada campo de detalle
  Widget _buildDetailField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: value,
              readOnly: true,
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onSuccess({required String name, required BuildContext context}) {
    Flushbar(
      // title: 'Hey Ninja',
      message:
          '¡Perfecto! Tu solicitud ha sido confirmada y enviada a ${name}. Gracias por formar parte de Pet Call.',
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        Icons.forward_to_inbox,
        color: Colors.white,
      ),
      backgroundColor: Colors.cyan,
    ).show(context);
  }
}

class _MyLocationMarker extends AnimatedWidget {
  const _MyLocationMarker(Animation<double> animation, {Key? key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final value = (listenable as Animation<double>).value;
    final newValue = lerpDouble(0.5, 1.0, value)!;
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
