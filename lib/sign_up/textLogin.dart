import 'package:flutter/material.dart';

class TextLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 41),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
