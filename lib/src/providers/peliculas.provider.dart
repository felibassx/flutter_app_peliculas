import 'dart:convert';

import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apiKey = 'f325141b6c6c6ab81333cbef19dec5a7';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _languaje
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;

  }

}