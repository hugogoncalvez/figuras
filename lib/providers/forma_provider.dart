import 'dart:async';
import 'dart:convert';
import 'package:desafio2_firebase/models/forma_modelo.dart';
import 'package:http/http.dart' as http;

class FigurasProvider {
  static final FigurasProvider _figurasProvider = new FigurasProvider._();

  FigurasProvider._();

  factory FigurasProvider() {
    return _figurasProvider;
  }

  static final StreamController<List<FormaModelo>>
      _streamSeleccionFigurasController = new StreamController.broadcast();

  List<FormaModelo> lista = [];
  List<FormaModelo> listaItemSelec = [];

  static Stream<List<FormaModelo>> get streamFigurasController =>
      _streamSeleccionFigurasController.stream;

  void limpiarLista() {
    _streamSeleccionFigurasController.sink.add(List.empty());
  }

  void cargarFiguras() async {
    this.lista = [];
    this.lista.addAll(lista);
    lista = await figurasFirebase();
    _streamSeleccionFigurasController.sink.add(this.lista);
  }

  Future figurasFirebase() async {
    List<FormaModelo> listaTemp = [];
    final String _baseURL = "figuras-717c2-default-rtdb.firebaseio.com";
    final url = Uri.https(_baseURL, 'Formas.json');
    final respuesta = await http.get(url);

    final Map<String, dynamic> figurasMap = json.decode(respuesta.body);

    figurasMap.forEach((key, value) {
      final tempFigura = FormaModelo.fromJson(value);

      tempFigura.id = key;
      listaTemp.add(tempFigura);
    });
    return listaTemp;
  }

  dispose() {
    _streamSeleccionFigurasController.close();
  }
}
