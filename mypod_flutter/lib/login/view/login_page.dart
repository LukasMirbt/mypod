import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/note/view/view.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: _SignInButton(),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    final client = context.watch<Client>();

    return SignInWithEmailButton(
      caller: client.modules.authentication,
      onSignedIn: () {
        Navigator.of(context).pushReplacement(
          NotePage.route(),
        );
      },
    );
  }
}
