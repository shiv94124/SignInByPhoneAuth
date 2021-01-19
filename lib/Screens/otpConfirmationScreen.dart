import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/phoneAuthService.dart';
import 'package:flutter_firebase/Widgets/customButton.dart';
import 'package:flutter_firebase/Widgets/customTextField.dart';


class OtpConfirmationScreen extends StatefulWidget {
  final String phoneNo;
  OtpConfirmationScreen({this.phoneNo, Key key}) : super(key: key);

  @override
  _OtpConfirmationScreenState createState() => _OtpConfirmationScreenState();
}

class _OtpConfirmationScreenState extends State<OtpConfirmationScreen> {
  String _otp,phoneNo;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  PhoneAuth phoneAuth;

  @override
  void initState() {
    super.initState();
    phoneNo=widget.phoneNo;
    phoneAuth=PhoneAuth(phoneNo: widget.phoneNo);
    phoneAuth.verifyPhone(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assests/images/netflix_image.jpg',
          fit: BoxFit.contain,
          height: 60,
          width: 100,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 80,16, 0),
            child: Text(
              "Verifying this Mobile No",
              style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize:30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 50),
            child: Text(
              '${widget.phoneNo}',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextField(
                hintText: 'Enter OTP',
                onSaved: (value) {
                  _otp = '$value';
                },
                validator: (value) {
                  if (value.length < 6 || value.length > 6) {
                    return "Invalid";
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
                  phoneAuth.signIn( context,smsOTP: _otp);
                }
              },
              text: 'Proceed',
            ),
          )
        ],
      ),
    );
  }
}
