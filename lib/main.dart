import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_project_beta_01/src/controller/channels_controller.dart';
import 'package:tv_project_beta_01/src/model/auth.dart';
import 'package:tv_project_beta_01/src/view/auth_page.dart';
import 'package:tv_project_beta_01/src/view/home_page.dart';
import 'package:tv_project_beta_01/src/view/player_page.dart';
import 'package:tv_project_beta_01/src/view/search_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) => ChannelController(),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => Auth(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/': (context) => const HomePage(),
        '/searchPage': (context) => const SearchPage(),
        '/player': ((context) => const PlayerPage()),
        '/auth': (context) => const AuthPage()
      },
    );
  }
}
