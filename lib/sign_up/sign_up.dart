import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {

  bool _isButtonEnabled = false;

  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool checkConditions() {
    String nickname = _nicknameController.value.text;
    String password = _passwordController.value.text;
    if (nickname.isNotEmpty && password.isNotEmpty)
      {
        return true;
      } else {
      return false;
    }
  }

  void startNewsPage() {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Тост"),
    ));
    if (checkConditions()) {

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [const Color(0xFFBB4E75), const Color(0xFFE74249)],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _text(),
            _autarization(context)
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 41),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text("Login",
        style: TextStyle(
            color: Colors.white, fontFamily: 'Roboto', fontSize: 18),
        ),
      ));
  }

  bool _isHidden = true;

  Widget _autarization(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16, top: 137),
      height: 450,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40),
            topRight: const Radius.circular(4),
            bottomLeft: const Radius.circular(4),
            bottomRight: const Radius.circular(40)
          )
          ),
        child:
            Container(
              padding: EdgeInsets.only(top: 48, left: 30, right: 30),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: "Nickname",
                    ),
                    controller: _nicknameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-z]'))
                    ],
                  ),

                  TextField(
                    obscureText: _isHidden,
                    style: TextStyle(fontSize: 14),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isHidden
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFFD1414F)
                        ),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.deny(RegExp('[а-яА-Я]'))
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 44),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(const Radius.circular(3)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [const Color(0xFFBB4E75), const Color(0xFFE74249)],
                            )
                        ),
                        child: MaterialButton(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white,
                                fontFamily: 'Roboto', fontSize: 16),
                          ),
                          onPressed:
                              _isButtonEnabled
                          ? null
                          : startNewsPage,
                        )
                    ),
                  ),
                ],
              ),
            )
        ),
      );
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}