import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/home/screens/home_screen.dart';
import 'package:miauapp_flutter_app/login/controller/database_helper.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/login/screens/recovery_screen.dart';
import 'package:miauapp_flutter_app/login/screens/register_screen.dart';
import 'package:miauapp_flutter_app/login/screens/register_socio_screen.dart';
import 'package:miauapp_flutter_app/menu/tabbar/fab_tab_menu.dart';
import 'package:miauapp_flutter_app/widgets/loading_dialog_widget.dart';
import 'package:sqflite/sqflite.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ImageProvider imgBackground =
      const AssetImage('assets/background-login-15.jpg');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();

    _passwordVisible = true;
    //_emailController.text = "rodnal@gmail.com";
    //_passwordController.text = "12345";
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
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Color y opacidad del filtro
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
                                  child: const Text(
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
                                            const Text(
                                              "¿Aún no tienes una cuenta? ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await LoadingDialogWidget.show(
                                                    context: context,
                                                    seconds: 3);
                                                // Acción del botón
                                                print('Botón presionado');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RegisterScreen()),
                                                );
                                              },
                                              child: const Text(
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
                                        child: const Text(
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
                                        child: const Text(
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
                                                  style: const TextStyle(
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
                                          await loginUser();
                                        },
                                        child: const Text(
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
                                                    onTap: () async {
                                                      await LoadingDialogWidget
                                                          .show(
                                                              context: context,
                                                              seconds: 3);
                                                      // Acción del botón
                                                      print('Botón presionado');
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                RecoveryScreen()),
                                                      );
                                                    },
                                                    child: const Text(
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
                                        child: const Text(
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
                                              const Text(
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
                                                  const Text(
                                                    "dale click en ",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await LoadingDialogWidget
                                                          .show(
                                                              context: context,
                                                              seconds: 3);
                                                      // Acción del botón
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                RegisterSocioScreen()),
                                                      );
                                                      print('Botón presionado');
                                                    },
                                                    child: const Text(
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

  Future<void> loginUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email != "" && password != "") {
      final user =
          await DatabaseHelper().getUserByEmailAndPassword(email, password);
      if (user != null) {
        print("-------------------------");
        print('Login exitoso para: ${user.role}');

        print("-------------------------");
        onSuccess();
        await LoadingDialogWidget.show(context: context, seconds: 3);
        // Redirigir al usuario o mostrar mensaje de éxito
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FabTabMenu(
              selectedIndex: 0,
              user: user,
            ),
          ),
        );
      } else {
        print('Credenciales incorrectas');
        // Mostrar mensaje de error
        onIncorrect();
      }
    } else {
      onInputEmpty();
    }
  }

  void onInputEmpty() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Por favor, complete el formulario."),
        duration: const Duration(seconds: 1),
        backgroundColor: Color.fromARGB(255, 219, 167, 22),
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

  void onIncorrect() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Las credenciales son incorrectas."),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
}
