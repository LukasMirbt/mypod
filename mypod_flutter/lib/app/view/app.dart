import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/app/view/view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App(this.client, {super.key});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: client,
      child: const AppView(),
    );
  }
}
