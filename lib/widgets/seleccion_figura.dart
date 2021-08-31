import 'package:desafio2_firebase/widgets/cuadrado.dart';
import 'package:flutter/material.dart';

class Figura extends StatelessWidget {
  final String figuraSeleccionada;
  Figura(this.figuraSeleccionada);
  @override
  Widget build(BuildContext context) {
    if (figuraSeleccionada == 'Cuadrado') {
      return Cuadrado(color: '0xff0ffff4');
    }
    return Container();
  }
}
