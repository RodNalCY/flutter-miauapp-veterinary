import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miauapp_flutter_app/login/controller/database_helper.dart';
import 'package:miauapp_flutter_app/login/model/user.dart';
import 'package:miauapp_flutter_app/login/screens/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:miauapp_flutter_app/login/utils/text_formatters.dart';
import 'package:miauapp_flutter_app/widgets/loading_dialog_widget.dart';

class RegisterSocioScreen extends StatefulWidget {
  const RegisterSocioScreen({super.key});

  @override
  State<RegisterSocioScreen> createState() => _RegisterSocioScreenState();
}

class _RegisterSocioScreenState extends State<RegisterSocioScreen> {
  ImageProvider imgBackground =
      const AssetImage('assets/background-login-5.jpg');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  late bool _passwordVisible;

  late bool _validateEmail;
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /************************************************************************** */
  TextEditingController _fileController = TextEditingController();
  File? _selectedFile;
  bool file_correct = false;

  Future<void> _pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      String? filePath = result.files.single.path;
      print("filePath > ${filePath}");

      if (filePath != null) {
        // Validar la extensión del archivo
        if (filePath.endsWith('.png') ||
            filePath.endsWith('.jpg') ||
            filePath.endsWith('.jpeg') ||
            filePath.endsWith('.pdf')) {
          // Dividimos el string por la carpeta 'file_picker/'
          List<String> parts = filePath.split('file_picker/');

          setState(() {
            _selectedFile = File(filePath);
            // _fileController.text =
            //    filePath; // Mostrar la ruta del archivo seleccionado

            _fileController.text = parts[1];
          });
        } else {
          // Si el archivo no es válido, muestra un mensaje de error
          onErrorFile(); // Llamar al método que muestra el SnackBar de error
        }
      }
    } else {
      // El usuario canceló la selección del archivo
      onErrorFile(); // Muestra el error si no se selecciona un archivo
    }
  }

  @override
  void initState() {
    super.initState();

    _passwordVisible = true;
    _validateEmail = false;
    _emailController.text = "";
    _passwordController.text = "";
    _nameController.text = "";
    _dateController.text = "";
    _fileController.text = "";
    _telefonoController.text = "";
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    _fileController.dispose();
    _telefonoController.dispose();
    super.dispose();
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
                                SizedBox(
                                  height: 35,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Crea una cuenta',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '\n de socio',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                                              "¿Ya tienes una cuenta? ",
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
                                                          LoginScreen()),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            inputFormatters: [
                                              // Esto convierte todo lo que se escriba a mayúsculas
                                              UpperCaseTextFormatter(),
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
                                          "CORREO",
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
                                            onChanged: (value) {
                                              if (!emailRegex
                                                  .hasMatch(value as String)) {
                                                setState(() {
                                                  _validateEmail = true;
                                                });
                                              } else {
                                                setState(() {
                                                  _validateEmail = false;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      _validateEmail
                                          ? const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Por favor, ingrese un correo electrónico válido.",
                                                style: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(
                                        height: 10,
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
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "FECHA DE NACIMIENTO",
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
                                                  controller: _dateController,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Selecciona una fecha',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                  readOnly:
                                                      true, // Hace que el campo sea de solo lectura
                                                  onTap: () {
                                                    _selectDate(
                                                        context); // Llama al selector de fecha
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.white),
                                                onPressed: () {
                                                  _selectDate(
                                                      context); // Llama al selector de fecha al presionar el icono
                                                },
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
                                          "DOCUMENTO",
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
                                                  controller: _fileController,
                                                  style: const TextStyle(
                                                      color: Colors.white54),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Adjunte archivo (.png .jpg .pdf)',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                  readOnly: true,
                                                  onTap: () {},
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.cloud_upload,
                                                  color: Colors.white,
                                                ),
                                                onPressed: _pickFile,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      if (_selectedFile != null)
                                        _buildFilePreview(_selectedFile!),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20.0),
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
                                          await registerUser();
                                        },
                                        child: const Text(
                                          'Registrar',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
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

  Future<void> registerUser() async {
    if (_nameController.text != "" &&
        _emailController.text != "" &&
        _passwordController.text != "" &&
        _dateController.text != "" &&
        _fileController.text != "" &&
        _telefonoController.text != "" &&
        _validateEmail == false) {
      await LoadingDialogWidget.show(context: context, seconds: 3);
      final newUser = User(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          birthDate: _dateController.text,
          role: "socio",
          file: _fileController.text,
          telefono: _telefonoController.text);

      await DatabaseHelper().insertUser(newUser);
      onSuccess();
      print('Usuario registrado: ${newUser.name}');
      print('Usuario file: ${newUser.file}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      onInputEmpty();
    }
  }

// Método para construir la vista previa del archivo
  Widget _buildFilePreview(File file) {
    String filePath = file.path;

    if (filePath.endsWith('.png') ||
        filePath.endsWith('.jpg') ||
        filePath.endsWith('.jpeg')) {
      // Vista previa de la imagen
      return Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco para resaltar la imagen
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Sombra de color negro con opacidad
              spreadRadius: 2, // Extensión de la sombra
              blurRadius: 8, // Difusión de la sombra
              offset: Offset(4, 4), // Desplazamiento de la sombra en x e y
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              15), // Asegura que la imagen también tenga bordes redondeados
          child: Image.file(
            file,
            width: 140,
            height: 140,
            fit:
                BoxFit.contain, // Ajusta la imagen para que llene el contenedor
          ),
        ),
      );
    } else if (filePath.endsWith('.pdf')) {
      return Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco para resaltar la imagen
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Sombra de color negro con opacidad
              spreadRadius: 2, // Extensión de la sombra
              blurRadius: 8, // Difusión de la sombra
              offset: Offset(4, 4), // Desplazamiento de la sombra en x e y
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              15), // Asegura que la imagen también tenga bordes redondeados
          child: PDFView(
            filePath:
                file.path, // Ajusta la imagen para que llene el contenedor
          ),
        ),
      );
    } else {
      // Llamar a onErrorFile() para mostrar el SnackBar y retornar un widget vacío

      return SizedBox.shrink(); // Retorna un widget vacío
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950), // Fecha mínima
      lastDate: DateTime(2030), // Fecha máxima
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData
              .dark(), // Opcional: tema oscuro para el selector de fecha
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  void onErrorFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Solo se permiten archivos .png, .jpg, .jpeg o .pdf."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  void onSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("El registro fue realizado con exito."),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
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
}
