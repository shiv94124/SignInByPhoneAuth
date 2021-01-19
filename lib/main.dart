import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Services/routingService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('${snapshot.error}');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: Home(),
            debugShowCheckedModeBanner: false,
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoutingBaseOndAuth().checkAuth();
  }
}
