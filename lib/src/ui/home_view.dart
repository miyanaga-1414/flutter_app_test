import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import '/src/services/account_service.dart';
import '/src/ui/login_view.dart';
import '/src/ui/amazon_list_page.dart';
import '/src/ui/youtube_list_page.dart';
import '/src/util/util.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = '/ui/login_view';

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Future<bool> isLogin;
  AccountService accountService = AccountService();

  @override
  void initState() {
    isLogin = accountService.isLoginConfirm();
    super.initState();
  }

  void change() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // isLogin = await accountService.isLoginConfirm();
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('ホーム画面'),
        // ),
        body: Center(
          child: FutureBuilder(
            future: isLogin,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              Widget childWidget;
              if (snapshot.data == true) {
                // ログイン後の画面を記載
                childWidget = MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text('ホーム'),
                    ),
                    body: Column(
                      children: [
                        ...[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubeList()));
                            },
                            // 対象の画像を記述
                            child: Image(
                              image: AssetImage('images/youtube.png'),
                              height: 280,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AmazonList()));
                            },
                            // 対象の画像を記述
                            child: Image(
                              image: AssetImage('images/amazon.jpeg'),
                              height: 280,
                            ),
                          ),
                        ].expand(
                          (widget) => [
                            widget,
                            const SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ]
                    ),
                  ),
                );
              } else {
                childWidget = MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text('ホーム'),
                    ),
                    body: TextButton(
                      child: const Text('ログイン'),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => Login()
                      )),
                    ),
                  ),
                );
              }
              return childWidget;
            }),
        )
    );
  }
}