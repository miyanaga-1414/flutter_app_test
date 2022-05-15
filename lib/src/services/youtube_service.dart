import '/src/models/movie.dart';
import 'dart:convert';
import '/src/repository/youtube_repository.dart';


class YoutubeService {
  /// 検索対象のアプリ情報を検索しています。
  Future<List<Movie>> search(String search) async {
    YoutubeRepository repository = YoutubeRepository();

    var response = await repository.search(search);
    var returnItems;
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(utf8.decode(response.body.runes.toList()))['items'];
      returnItems = movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      return data;
    }

    return returnItems;
  }
}

const data = [
  Movie(
    name: 'test2',
    id: 'test',
    description: 'test'
  )
];

