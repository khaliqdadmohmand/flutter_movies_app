class Movies {
  String? title;
  String? released;
  String? runtime;
  String? genre;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? type;
  List<String>? images;

  Movies(
      {required this.title,
      required this.released,
      required this.runtime,
      required this.genre,
      required this.actors,
      required this.plot,
      required this.language,
      required this.country,
      required this.type,
      required this.images});

  Movies.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    type = json['Type'];
    images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Released'] = this.released;
    data['Runtime'] = this.runtime;
    data['Genre'] = this.genre;
    data['Actors'] = this.actors;
    data['Plot'] = this.plot;
    data['Language'] = this.language;
    data['Country'] = this.country;
    data['Type'] = this.type;
    data['Images'] = this.images;
    return data;
  }
}
