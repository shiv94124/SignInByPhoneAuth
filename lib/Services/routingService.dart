import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Screens/loggedInScreen.dart';
import 'package:flutter_firebase/Screens/signInScreen.dart';

class RoutingBaseOndAuth {
  checkAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data != null)
              return LoggedInScreen();
            else
              return SignInScreen();
          }
          return CircularProgressIndicator();
        });
  }
}
