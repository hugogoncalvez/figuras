// To parse this JSON data, do
//
//     final seleccionModelo = seleccionModeloFromJson(jsonString);

import 'dart:convert';

SeleccionModelo seleccionModeloFromJson(String str) => SeleccionModelo.fromJson(json.decode(str));

String seleccionModeloToJson(SeleccionModelo data) => json.encode(data.toJson());

class SeleccionModelo {
    SeleccionModelo({
        this.id,
        required this.descripcion,
        required this.color,
    });

    int? id;
    String descripcion;
    String color;

    factory SeleccionModelo.fromJson(Map<String, dynamic> json) => SeleccionModelo(
        id: json["id"],
        descripcion: json["descripcion"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "color": color,
    };
}
