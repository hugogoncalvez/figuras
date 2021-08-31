import 'dart:async';
import 'dart:convert';
import 'package:desafio2_firebase/models/color_modelo.dart';

import 'package:http/http.dart' as http;

class ColorProvider {
  static final ColorProvider _coloresProvider = new ColorProvider._();

  ColorProvider._();

  factory ColorProvider() {
    return _coloresProvider;
  }

  static final StreamController<List<ColorModelo>>
      _streamSeleccionColoresController = new StreamController.broadcast();

  List<ColorModelo> lista = [];

  static Stream<List<ColorModelo>> get streamColoresController =>
      _streamSeleccionColoresController.stream;

 

  void cargarColores() async {
    this.lista = [];
    this.lista.addAll(lista);
    lista = await coloresFirebase();
    _streamSeleccionColoresController.sink.add(this.lista);
  }

  Future coloresFirebase() async {
    List<ColorModelo> listaTemp = [];
    final String _baseURL = "figuras-717c2-default-rtdb.firebaseio.com";
    final url = Uri.https(_baseURL, 'Colores.json');
    final respuesta = await http.get(url);

    final Map<String, dynamic> figurasMap = json.decode(respuesta.body);

    figurasMap.forEach((key, value) {
      final tempColor = ColorModelo.fromJson(value);
      
      tempColor.id = key;
      listaTemp.add(tempColor);
    });
    return listaTemp;
  }

 

  dispose() {
    _streamSeleccionColoresController.close();
  }
}