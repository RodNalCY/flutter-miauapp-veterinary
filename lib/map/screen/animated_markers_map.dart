import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:miauapp_flutter_app/map/model/map_marker.dart';
import 'package:miauapp_flutter_app/menu/drawer/side_menu.dart';
import 'package:another_flushbar/flushbar.dart';

const MAPBOX_ACCESS_TOKEN =
    "pk.eyJ1Ijoicm9kbmFsIiwiYSI6ImNtMmx3aHUyNTBoYWkybHB2cTdvZ2p4a3oifQ.TjBnXTGuCaJwJV_hQWUmxQ";
const MAPBOX_STYLE = "mapbox/dark-v11";
const MARKER_COLOR = Colors.white;
final _myLocation = LatLng(-12.121145, -77.030404);
const MARKER_SIZE_EXPANDED = 50.0;
const MARKER_SIZE_SHRINKED = 40.0;

class AnimatedMarkersMap extends StatefulWidget {
  const AnimatedMarkersMap({super.key});

  @override
  State<AnimatedMarkersMap> createState() => _AnimatedMarkersMapState();
}

class _AnimatedMarkersMapState extends State<AnimatedMarkersMap>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  final _markerList = <Marker>[];
  int _selectedIndex = 0;
  late final AnimationController _animationController;
  List<Marker> _buildMarkers() {
    _markerList.clear(); // Limpia la lista antes de reconstruir los marcadores
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          // El tamaño ahora depende de si el marcador está seleccionado o no
          height:
              _selectedIndex == i ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED,
          width:
              _selectedIndex == i ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED,
          point: mapItem.location,
          child: GestureDetector(
            onTap: () {
              _selectedIndex = i;
              setState(() {
                _pageController.animateToPage(i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut);
                print("Selected ${mapItem.title}");
              });
            },
            child: _LocationMarker(
              selected:
                  _selectedIndex == i, // Controla el estado del tamaño aquí
              imagePath: mapItem.image_pointer,
            ),
          ),
        ),
      );
    }
    return _markerList;
  }

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
    final _markers = _buildMarkers();
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: SideMenu(),
      appBar: AppBar(
        title: const Text(
          "Maps",
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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 15,
              initialZoom: 14,
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
                markers: _markers,
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mapMarkers.length,
              itemBuilder: (context, index) {
                final item = mapMarkers[index];
                return _MapItemDetails(mapMarker: item);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {
  const _LocationMarker(
      {super.key, this.selected = false, required this.imagePath});

  final bool selected;
  final String imagePath; // Guardamos la ruta de la imagen

  @override
  Widget build(BuildContext context) {
    final size = selected ? MARKER_SIZE_EXPANDED : MARKER_SIZE_SHRINKED;
    return Center(
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: const Duration(milliseconds: 400),
        child: Image.asset(imagePath),
      ),
    );
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

class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({Key? key, required this.mapMarker}) : super(key: key);
  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    final _styleTitle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    final _styleAdress = TextStyle(color: Colors.grey[800], fontSize: 14);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20, left: 10, right: 10),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // Establece el ancho
                      //height: 200, // Establece la altura
                      child: ClipOval(
                        // Recorta la imagen de manera circular
                        child: Image.asset(
                          mapMarker.image,
                          fit: BoxFit
                              .contain, // Ajusta la imagen para que se contenga dentro del contenedor
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          mapMarker.title,
                          style: _styleTitle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            mapMarker.description,
                            style: _styleAdress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            mapMarker.address,
                            style: _styleAdress,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: StarRating(
                  rating: mapMarker.score, // Calificación dinámica
                  starSize: 30.0, // Tamaño de las estrellas
                  filledStarColor: Colors.amber, // Estrellas llenas
                  emptyStarColor: Colors.amber.shade400, // Estrellas vacías
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              color: Colors.black,
              elevation: 6,
              child: Text(
                'CONTACTAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                onSuccess(title: mapMarker.title, context: context);
              },
            )
          ],
        ),
      ),
    );
  }

  void onSuccess({required String title, required BuildContext context}) {
    Flushbar(
      // title: 'Hey Ninja',
      message:
          'Tu solicitud ha sido enviada a ${title}. Por favor, espera la confirmación de tu reserva.',
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

class StarRating extends StatelessWidget {
  final int rating; // La calificación actual (de 1 a 5)
  final int maxRating; // La cantidad máxima de estrellas
  final Color filledStarColor; // Color de las estrellas llenas
  final Color emptyStarColor; // Color de las estrellas vacías
  final double starSize; // Tamaño de las estrellas

  StarRating({
    required this.rating,
    this.maxRating = 5,
    this.filledStarColor = Colors.amber,
    this.emptyStarColor = Colors.grey,
    this.starSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating
              ? Icons.star
              : Icons.star_border, // Estrella llena o vacía
          color: index < rating
              ? filledStarColor
              : emptyStarColor, // Cambiar el color según el índice
          size: starSize, // Ajustar el tamaño de la estrella
        );
      }),
    );
  }
}
