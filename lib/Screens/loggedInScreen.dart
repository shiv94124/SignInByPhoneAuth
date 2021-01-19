import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/phoneAuthService.dart';

class LoggedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("VOILA !", style: TextStyle(color: Colors.white, fontSize: 30))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assests/images/netflix_image_loggedIn.jpg',fit: BoxFit.contain,),
          ),
          Center(
            child: Text("Welcome to Netflix, You are successfully Logged In !",
                style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 40),
          Center(
            child: RaisedButton(
                onPressed: () {
                  PhoneAuth().signOut();
                },
                child: Text("Sign Out")),
          ),
        ],
      ),
    );
  }
}
