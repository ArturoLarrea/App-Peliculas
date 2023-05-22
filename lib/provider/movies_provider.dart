import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//aqui aprendi a utilizar apis y hacer peticiones http.
//junto con su utilizacion en dart esto se hace mediante 2 paquetes http y provider
class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '78f0e668f1964b809e3d22825d5fdd8b';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  MoviesProvider() {
    print("Se creo el provider");
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    var response = await http.get(url);
    print(response.body);
  }
}
