import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_peliculas/model/models.dart';

//aqui aprendi a utilizar apis y hacer peticiones http.
//junto con su utilizacion en dart esto se hace mediante 2 paquetes http y provider
//aqui documentare como se creo la peticion http y el manejo de la informacion
class MoviesProvider extends ChangeNotifier {
  //utilizamos estas propiedades solo para almacenar datps de importancia para la peticion
  final String _apiKey = '78f0e668f1964b809e3d22825d5fdd8b';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movies> onDisplayMovies = [];

  MoviesProvider() {
    print("Se creo el provider");
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    // aqui creamos una variale de tipo Uri esta clase crea una url
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    // importamos y utilizamos el paquete HTTP que añadimos anteriormente a pubspec. usamos http.get metodo para realizar la peticion http que se almacenara en response
    var response = await http.get(url);
    //utilizando postman obtuvimos los datos de la peticion con anterioridad y usando quicktype copiamos esos datos para que los convirtiera en una clase
    //nota mental: convertir toda la informacion en una clase y sus valores tambien nos sirve de mucho para poder manejar estos mismos con mayor facilidad asi accedemos a los datos que queremos con un simple llamdo a esa propiedad esta forma de manejar los datos tengo que dominarar y aprenderla mas en profundidad. tambien ver si har otras formas de hacerlo
    var nowplaying = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowplaying.results;
    notifyListeners();
  }
}
