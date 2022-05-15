import '/src/models/movie.dart';
import 'package:http/http.dart' as http;

class YoutubeRepository {

  /// 検索対象のアプリ情報を検索しています。
  Future<http.Response> search(final String search) async {
    const String DEVELOPER_KEY = 'AIzaSyBIA8k4TYG7F6BFNJcutwtTfKZcWkJc96c';
    const String YOUTUBE_API_SERVICE_NAME = "youtube";
    const String YOUTUBE_API_VERSION = "v3";
    var params = {'key' : DEVELOPER_KEY, 'part' : 'snippet', 'q' : search};
    var url = Uri.https('www.googleapis.com', '/youtube/v3/search', params);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    return response;
  }
}
