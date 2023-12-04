import 'dart:convert';

Remembers remembersFromJson(String str) => Remembers.fromJson(json.decode(str));

String remembersToJson(Remembers data) => json.encode(data.toJson());

class Remembers {
  String? id;
  String? fechaCita;
  String? horaCita;
  String? userId;
  String? notaTexto;
  String? notaFoto;
  double? latitud;
  double? longitud;

  Remembers({
    this.id,
    this.fechaCita,
    this.horaCita,
    this.userId,
    this.notaTexto,
    this.notaFoto,
    this.latitud,
    this.longitud,
  });

  factory Remembers.fromJson(Map<String, dynamic> json) => Remembers(
        id: json["id"],
        fechaCita: json["fechaCita"],
        horaCita: json["horaCita"],
        userId: json["userId"],
        notaFoto: json["notaFoto"],
        notaTexto: json["notaTexto"],
        latitud: json["latitud"]?.toDouble(),
        longitud: json["longitud"]?.toDouble(),
      );

  static List<Remembers> fromJsonList(List<dynamic> jsonList) {
    List<Remembers> toList = [];

    jsonList.forEach((item) {
      Remembers remembers = Remembers.fromJson(item);
      toList.add(remembers);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaCita": fechaCita,
        "horaCita": horaCita,
        "userId": userId,
        "notaTexto": notaTexto,
        "notaFoto": notaFoto,
        "latitud": latitud,
        "longitud": longitud,
      };
}
