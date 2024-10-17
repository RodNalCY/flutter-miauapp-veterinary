import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/login/screens/recovery_screen.dart';
import 'package:miauapp_flutter_app/login/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ImageProvider imgBackground =
      const AssetImage('assets/background-login-3.jpg');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();

    _passwordVisible = true;
    _emailController.text = "";
    _passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imgBackground, // Ruta de tu imagen
            fit: BoxFit.none,
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
                                  child: Text(
                                    "Ingresar",
                                    style: TextStyle(
                                      fontSize: 55,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(20.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "¿Aún no tienes una cuenta? ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // Acción del botón
                                                print('Botón presionado');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegisterScreen()),
                                                );
                                              },
                                              child: Text(
                                                "ingresa aqui",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "EMAIL",
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
                                            controller: _emailController,
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
                                        height: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "CONTRASEÑA",
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
                                                  obscureText: _passwordVisible,
                                                  enableSuggestions: false,
                                                  autocorrect: false,
                                                  controller:
                                                      _passwordController,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _passwordVisible =
                                                        !_passwordVisible;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 40.0),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              Colors.black.withOpacity(0.7),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(
                                            double.infinity,
                                            50,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(2),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          onSuccess();
                                        },
                                        child: Text(
                                          'Ingresar',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(20.0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // Acción del botón
                                                      print('Botón presionado');
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                RecoveryScreen()),
                                                      );
                                                    },
                                                    child: Text(
                                                      "¿Olvidaste tu contraseña?",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 40.0),
                                      ),
                                      Container(
                                        child: Text(
                                          "Eres socio",
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Inicia Sesión para socios",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "dale click en ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      // Acción del botón
                                                      print('Botón presionado');
                                                    },
                                                    child: Text(
                                                      "continuar",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
            ],
          ),
        ),
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Las credenciales son correctas."),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
