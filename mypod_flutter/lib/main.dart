import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/app/app.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final client = Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  final sessionManager = SessionManager(
    caller: client.modules.authentication,
  );

  await sessionManager.initialize();

  runApp(
    App(client),
  );
}
