import 'package:flutter/material.dart';
import 'package:peliculas/src/models/peliculas_model.dart';
import 'package:peliculas/src/providers/peliculas.provider.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProviders = new PeliculasProvider();

final peliculas = [
  'Superman',
  'Batman',
  'Star Wars',
  'Star Trek',
  'Avatar',
  'El Joker',
  'Ironman',
  'Spiderman',
  'Aquaman'
];
final peliculasRecientes = [
  'Spiderman',
  'Aquaman'
];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del appbar

    return [
      IconButton(
        icon: Icon( Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builder que crea los resultados
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      
      future: peliculasProviders.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

        final peliculas = snapshot.data;

        if (snapshot.hasData) {
          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );


    // Sugenrencias que aparece al escribir

    // final listaSugerida = ( query.isEmpty ) 
    //                       ? peliculasRecientes 
    //                       : peliculas.where( (p)=> p.toLowerCase().startsWith(query.toLowerCase()) ).toList();


    // return ListView.builder(
    //   itemCount: listaSugerida.length,
    //   itemBuilder: (context, i) {
    //     return ListTile(
    //       leading: Icon(Icons.movie),
    //       title: Text(listaSugerida[i]),
    //       onTap: () {
    //         seleccion = listaSugerida[i];
    //         showResults(context);
    //       },
    //     );
    //   },
    // );
  }

}