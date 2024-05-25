import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/app/app.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

void main() {
  final client = Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(
    App(client),
  );
}
