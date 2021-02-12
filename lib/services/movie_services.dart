part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    String endPoint =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page';

    client ??= http.Client();

    var response = await client.get(endPoint);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJSON(e)).toList();
  }

  static Future<MovieDetail> getDetail(Movie movie,
      {int movieID, http.Client client}) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/${movieID ?? movie.id}?api_key=$apiKey&language=en-US';

    client ??= http.Client();

    var response = await client.get(endPoint);
    var result = json.decode(response.body);

    List genres = (result as Map<String, dynamic>)['genres'];
    String language;

    switch ((result as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = 'Japanese';
        break;
      case 'en':
        language = 'English';
        break;
      case 'ko':
        language = 'Korea';
        break;
      case 'id':
        language = 'Indonesia';
        break;
      case 'ja':
        language = 'Japanese';
        break;
    }

    return movieID != null
        ? MovieDetail(Movie.fromJSON(result),
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList())
        : MovieDetail(movie,
            language: language,
            genres: genres
                .map((e) => (e as Map<String, dynamic>)['name'].toString())
                .toList());
  }

  static Future<List<Credit>> getCredit(int movieID,
      {http.Client client}) async {
    String endPoint =
        'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey&language=en-US';

    client ??= http.Client();

    var response = await client.get(endPoint);
    var result = json.decode(response.body);

    return ((result as Map<String, dynamic>)['cast'] as List)
        .map((e) => Credit(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
