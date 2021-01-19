import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Screens/otpConfirmationScreen.dart';
import 'package:flutter_firebase/Widgets/customButton.dart';
import 'package:flutter_firebase/Widgets/customTextField.dart';



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String phoneNo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            'assests/images/netflix_image.jpg',
            fit: BoxFit.contain,
            height: 60,
            width: 100,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  labelText: 'Phone No',
                  onSaved: (value) {
                    phoneNo = '+91$value';
                  },
                  validator: (value) {
                    if (value.length < 10 || value.length > 10) {
                      return "Invalid Phone Number";
                    } else {
                      _formkey.currentState.save();
                      return null;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            OtpConfirmationScreen(
                              phoneNo: phoneNo,
                            )));
                  }
                },
                text: "Sign in with OTP",
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
