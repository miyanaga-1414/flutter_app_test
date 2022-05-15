import 'package:flutter/material.dart';

import '/src/models/movie.dart';
import '/src/services/youtube_service.dart';
import '/src/ui/login_view.dart';
import '/src/util/util.dart';


class YoutubeList extends StatefulWidget {
  const YoutubeList({Key? key}) : super(key: key);
  static String routeName = '/ui/youtube_list_page';

  @override
  _YoutubeListState createState() => _YoutubeListState();
}


class _YoutubeListState extends State<YoutubeList> {
  YoutubeService service = YoutubeService();
  List<Movie> movieList = [];
  bool _searchBoolean = false;

  @override
  void initState() {
    super.initState();
  }

  void change() {
    setState(() {
    });
  }

  Widget _searchTextField() {
    return TextField(
      autofocus: true, //TextFieldが表示されるときにフォーカスする（キーボードを表示する）
      cursorColor: Colors.white, //カーソルの色
      style: TextStyle( //テキストのスタイル
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, //キーボードのアクションボタンを指定
      decoration: InputDecoration( //TextFiledのスタイル
        enabledBorder: UnderlineInputBorder( //デフォルトのTextFieldの枠線
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder( //TextFieldにフォーカス時の枠線
            borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search', //何も入力してないときに表示されるテキスト
        hintStyle: TextStyle( //hintTextのスタイル
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
      onSubmitted: (String inputText) {
        search(inputText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final headerStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: !_searchBoolean ? Text('Youtube') : _searchTextField(),
        actions: !_searchBoolean ? [
          IconButton(
          icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _searchBoolean = true;
              });
            })
          ]
        : [
          IconButton(
          icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchBoolean = false;

              });
            }
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(title: Text('検索結果', style: headerStyle)),
            ...movieList.map((movie) => MovieTile(movie: movie)),
          ],
        ),
    );
  }

  /// 検索対象の動画を検索しています。
  void search(String search) async {
    List<Movie> list = await service.search(search);

    setState(() {
      movieList = list;
    });
  }
}

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.name),
      onTap: () {
        Navigator.pushNamed(context, movie.description);
      },
    );
  }
}
