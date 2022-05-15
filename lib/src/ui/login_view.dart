import 'package:flutter/material.dart';

import '/src/models/account_info.dart';
import '/src/services/account_service.dart';
import '/src/ui/home_view.dart';
import '/src/ui/password_settings_view.dart';
import '/src/util/util.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/ui/login_view';

  @override
  _LoginState createState() => _LoginState();
}

class PageArguments{
  final bool isLogin;
  PageArguments(this.isLogin);
}


class _LoginState extends State<Login> {
  AccountInfo accountInfo = AccountInfo();
  AccountService service = AccountService();

  @override
  void initState() {
    super.initState();
  }

  void change() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // This widget is built using an AnimatedContainer, one of the easiest to use
    // animated Widgets. Whenever the AnimatedContainer's properties, such as decoration,
    // change, it will handle animating from the previous value to the new value. You can
    // specify both a Duration and a Curve for the animation.
    // This Widget is useful for designing animated interfaces that just need to change
    // the properties of a container. For example, you could use this to design expanding
    // and shrinking cards.
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...[
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Your email address',
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      accountInfo.email = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      accountInfo.password = value;
                    },
                  ),
                  TextButton(
                    child: const Text('Sign in'),
                    onPressed: () async {
                      // Use a JSON encoded string to send
                      String? password = accountInfo.password;
                      String? email = accountInfo.email;
                      bool isLogin = false;
                      if (password != null && email != null) {
                        isLogin = await service.login(email, password);
                      }

                      if (isLogin) {
                        //  ホーム画面へ遷移
                        Navigator.push(context, MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => HomePage()
                        ));
                      } else {
                        await Util.utilShowDialog(context, 'メールアドレスまたはパスワードが誤っています。');
                      }
                    },
                  ),
                ].expand(
                      (widget) => [
                    widget,
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
                ElevatedButton(
                  child: const Text(
                    'アカウント設定',
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(
                    // （2） 実際に表示するページ(ウィジェット)を指定する
                      builder: (context) => PasswordSettings()
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
