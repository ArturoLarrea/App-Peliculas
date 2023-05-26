// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

import 'movies.dart';

//esta es la clase creada a partir de quicktype para almacenar los datos y manejarlos de mejor manejra
class NowPlayingResponse {
  Dates dates;
  int page;
  List<Movies> results;
  int totalPages;
  int totalResults;

  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

//nota mental: aqui aprendia algo nuevo pero tengo que estudiarlo mas para ver si lo entendi bien
//factory da a identificar un constructor por nombre que no necesariamente crea una instancia de clase, util para realizar diferentes tareas en este caso decodificar la informacion que viene en json con  json.decode

  factory NowPlayingResponse.fromRawJson(String str) =>
      NowPlayingResponse.fromJson(json.decode(str));

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results:
            List<Movies>.from(json["results"].map((x) => Movies.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
