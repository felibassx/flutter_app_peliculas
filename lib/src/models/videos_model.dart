class Trailers {
  List<Trailer> trailers = new List();

  Trailers();

  Trailers.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final trailer = new Trailer.fromJsonMap(item);
      trailers.add(trailer);
    }
  }
}

class Trailer {
  String id;
  String iso6391;
  String iso31661;
  String key;
  String name;
  String site;
  int size;
  String type;

  Trailer({
    this.id,
    this.iso6391,
    this.iso31661,
    this.key,
    this.name,
    this.site,
    this.size,
    this.type,
  });

  Trailer.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    key = json['key'];
    name = json['name'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
  }

  getTrailerKey() {
    if (key == null) {
      return '';
    } else {
      return 'https://www.youtube.com/watch?v=' + key;
    }
  }
}
