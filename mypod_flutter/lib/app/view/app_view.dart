import 'package:flutter/material.dart';
import 'package:mypod_flutter/login/view/login_page.dart';
import 'package:mypod_flutter/note/view/view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (_) => NotePage.route(),
    );
  }
}
