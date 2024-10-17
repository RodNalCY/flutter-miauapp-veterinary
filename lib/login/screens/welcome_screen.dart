import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:miauapp_flutter_app/login/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  // Lista de descripciones
  final List<String> _descriptions = [
    'La app ofrece un servicio excelente, facilitando el cuidado de mi mascota sin la necesidad de desplazamientos. ¡Ideal para quienes buscan comodidad y bienestar en un solo lugar!',
    'Me encantó lo fácil que fue agendar una cita y recibir atención personalizada en la comodidad de mi hogar. Mi mascota se sintió relajada, y todo el proceso fue muy eficiente',
    'Gracias a la app, pude recibir atención veterinaria en casa sin causar estrés a mi mascota. El servicio es rápido, confiable y muy cómodo. ¡Totalmente recomendable!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20.0), // Bordes redondeados
                  child: Image.asset(
                    'assets/sliders/slider-${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
              carouselController: _controller,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height *
                    0.5, // Ajusta la altura
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction:
                    0.65, // Muestra una pestaña de la siguiente imagen
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => _controller.animateToPage(index),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentPage ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Bienvenid@ a Pet Call",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              _descriptions[
                  _currentPage], // Muestra la descripción de acuerdo con la página actual
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              minimumSize: Size(160, 50),
              padding: EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onPressed: () {
              print('Botón presionado');
              onSuccess();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              'Siguiente',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Bienvenido a Pet Call."),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
