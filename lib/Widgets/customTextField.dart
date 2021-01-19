import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String labelText;
  final String hintText;

  CustomTextField({
    this.onSaved,
    this.onChanged,
    this.validator,
    this.labelText,
    Key key,
    this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[600]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: validator ?? null,
          onSaved: onSaved ?? null,
          autofocus: false,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              // filled: true,
              // fillColor: Colors.grey[600],
              labelText: labelText ?? null,
              hintText: hintText ?? null,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15.0,
              )),
        ),
      ),
    );
  }
}
