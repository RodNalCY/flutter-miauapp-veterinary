import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.title,
    required this.description,
    required this.address,
    required this.location,
    required this.score,
  });

  final String image;
  final String title;
  final String description;
  final String address;
  final LatLng location;
  final int score;
}

final _locations = [
  LatLng(-12.118478,
      -77.032555), // Edificio El Pardo, Av. José Pardo 422, Miraflores 15074
  LatLng(-12.121458, -77.025667), // Progreso, Miraflores 15074
  LatLng(-12.112727, -77.023229), // Antero Aspillaga 814-896, Surquillo 15047
  LatLng(-12.113472, -77.030269), // Av. Angamos Este 120-198, Miraflores 15074
  LatLng(-12.125301, -77.031732), // Petit Jean Ocharán, Miraflores 15074
  LatLng(-12.128370, -77.026917), // Av. la Paz 1099, Miraflores 15074
  LatLng(-12.116571, -77.019176), // Gonzáles Prada 1002-1086, Surquillo 15047
  LatLng(
      -12.116205, -77.043852), // Av. Gral. Mendiburu 397-299, Miraflores 15074
  LatLng(-12.119110,
      -77.040695), // Concepto Aqua, Av. José Pardo 1173, Miraflores 15074
  LatLng(-12.129751, -77.029700), // Armendáriz, Miraflores 15074
  LatLng(-12.139302, -77.022271), // Urb la Viñita, Barranco
  LatLng(-12.126519, -77.009307), // Fernando Venegas, Miraflores 15048
];

const _path = "assets/logos";

final mapMarkers = [
  MapMarker(
    image: "${_path}/logo-1.jpg",
    title: "Pet Paradise",
    description: "Baños y cuidados especiales para tus mascotas.",
    address: "Edificio El Pardo, Av. José Pardo 422, Miraflores 15074",
    location: _locations[0],
    score: 3,
  ),
  MapMarker(
    image: "${_path}/logo-2.jpg",
    title: "Happy Paws",
    description: "Ofrecemos baños y grooming profesional.",
    address: "Progreso, Pr. 15 Miraflores 15074",
    location: _locations[1],
    score: 4,
  ),
  MapMarker(
    image: "${_path}/logo-3.jpg",
    title: "Pawfect Care",
    description: "Especialistas en baños para perros y gatos.",
    address: "Antero Aspillaga 814-896, Surquillo 15047",
    location: _locations[2],
    score: 5,
  ),
  MapMarker(
    image: "${_path}/logo-4.jpg",
    title: "Furry Haven",
    description: "Baño, peluquería y spa para tus mascotas.",
    address: "Av. Angamos Este 120-198, Miraflores 15074",
    location: _locations[3],
    score: 3,
  ),
  MapMarker(
    image: "${_path}/logo-5.jpg",
    title: "Mundo Mascota",
    description: "Baños relajantes para perros y gatos.",
    address: "Petit Jean Ocharán, Miraflores 15074",
    location: _locations[4],
    score: 2,
  ),
  MapMarker(
    image: "${_path}/logo-6.jpg",
    title: "Best Friends",
    description: "Servicio de baño y peluquería para mascotas.",
    address: "Av. la Paz 1099, Miraflores 15074",
    location: _locations[5],
    score: 3,
  ),
  MapMarker(
    image: "${_path}/logo-7.jpg",
    title: "PeluDog - Estética",
    description: "Cuida la higiene de tu mascota con nuestros baños.",
    address: "Gonzáles Prada 1002-1086, Surquillo 15047",
    location: _locations[6],
    score: 5,
  ),
  MapMarker(
    image: "${_path}/logo-8.jpg",
    title: "Fur & Shine",
    description: "Baños y cuidados personalizados para tu mascota.",
    address: "Av. Gral. Mendiburu 397-299, Miraflores 15074",
    location: _locations[7],
    score: 2,
  ),
  MapMarker(
    image: "${_path}/logo-9.jpg",
    title: "Woof & Meow",
    description: "Baños especializados para mascotas de todas las razas.",
    address: "Armendáriz, Miraflores 15074",
    location: _locations[8],
    score: 3,
  ),
  MapMarker(
    image: "${_path}/logo-10.jpg",
    title: "VetLuxe - Estética y Bienestar Animal",
    description: "Baños completos y aromaterapia para tus mascotas.",
    address: "Urb la Viñita, Barranco",
    location: _locations[9],
    score: 5,
  ),
  MapMarker(
    image: "${_path}/logo-11.jpg",
    title: "Royal Paws",
    description: "Baño y cuidados para mascotas.",
    address: "Fernando Venegas, Miraflores 15048",
    location: _locations[10],
    score: 0,
  ),
];
