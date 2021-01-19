import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  CustomButton({@required this.onPressed, Key key, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: OutlineButton(
        onPressed: onPressed,
        color: Colors.transparent,
        highlightedBorderColor: Colors.white,
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$text',
            style: TextStyle(color: Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
