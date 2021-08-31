import 'package:desafio2_firebase/providers/seleccion_figura_provider.dart';
import 'package:flutter/material.dart';

class MostrarFigura extends StatelessWidget {
  const MostrarFigura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirugaSeleccionadaProvider.streamFiguraSeleccionada,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return Container();

        print(snapshot.data);

        return Container();
      },
    );
  }
}
