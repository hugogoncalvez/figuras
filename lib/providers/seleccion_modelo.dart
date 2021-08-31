import 'dart:async';

import 'package:desafio2_firebase/models/seleccion_modelo.dart';

class SeleccionProvider {
  static final SeleccionProvider _seleccionProvider = new SeleccionProvider._();

  SeleccionProvider._();

  factory SeleccionProvider() {
    return _seleccionProvider;
  }

  static final StreamController<List<SeleccionModelo>>
      _streamSeleccionFigurasController = new StreamController.broadcast();

  List<SeleccionModelo> lista = [];
  List<SeleccionModelo> listaItemSelec = [];

  static Stream<List<SeleccionModelo>> get streamFigurasController =>
      _streamSeleccionFigurasController.stream;

  void limpiarLista() {
    _streamSeleccionFigurasController.sink.add(List.empty());
  }

  void cargarFiguras(String id, String descripcion) async {
    this.listaItemSelec = [];
    this.listaItemSelec.addAll(listaItemSelec);

    _streamSeleccionFigurasController.sink.add(this.listaItemSelec);
  }

  dispose() {
    _streamSeleccionFigurasController.close();
  }
}
