import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/model/auth.dart';
import 'package:tv_project_beta_01/src/view/auth_page.dart';
import 'package:tv_project_beta_01/src/view/home_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    print(auth.isAuth);
    return auth.isAuth ? const HomePage() : const AuthPage();
  }
}
