import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tv_project_beta_01/src/components/auth_form.dart';
import 'package:tv_project_beta_01/src/utils/ux_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  child: Image.asset('lib/src/assets/authPage/auth_art.png')),
              AuthForm()
            ],
          ),
        ),
      )),
    );
  }
}
