// lib/utils/loading_dialog.dart
import 'package:flutter/material.dart';

class LoadingDialogWidget {
  // Método para mostrar el diálogo de carga
  static Future<void> show(
      {required BuildContext context, int seconds = 3}) async {
    final dialog = showDialog(
      context: context,
      barrierDismissible: false, // Bloquea el cierre al tocar fuera
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );

    // Espera el tiempo especificado (predeterminado: 3 segundos)
    await Future.delayed(Duration(seconds: seconds));

    // Cierra el diálogo después del tiempo
    Navigator.of(context).pop();

    // Espera a que el diálogo se cierre
    await dialog;
  }
}
