import 'package:flutter/material.dart';

import '/src/models/movie.dart';
import '/src/ui/password_settings_view.dart';
import '/src/services/youtube_service.dart';
import '/src/ui/login_view.dart';
import '/src/util/util.dart';


class AmazonList extends StatelessWidget {
  const AmazonList({Key? key}) : super(key: key);
  static String routeName = '/ui/youtube_list_page';

  @override
  Widget build(BuildContext context) {

    const data = [
      Text("item0"),Text("item1"),Text("item2"),Text("item3"),Text("item4"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...[
                  TextFormField(
                    autofocus: true,
                    // textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.youtube_searched_for),
                      filled: true,
                    ),
                  ),
                  // const SizedBox(height: 16),
                  // Text('検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // const SizedBox(height: 16),
                ].expand(
                      (widget) => [
                    widget,
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 検索対象の動画を検索しています。
  Future<List<Movie>> search(String search) async {

    return [];
  }
}
