import 'package:fitness_app/request/request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_app/news/news.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {

  bool _isButtonEnabled = false;

  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool checkConditions() {
    String nickname = _nicknameController.value.text;
    String password = _passwordController.value.text;
    if (nickname.isNotEmpty && password.isNotEmpty && (password.length >= 3) )
      {
        return true;
      } else {
      return false;
    }
  }

  void startNewsPage() {
    FocusScope.of(context).unfocus();

    if (checkConditions()) {
      Request request = new Request();
      Future<String> token = request.getToken();

      token.then((value) {
        if (value == "Bad connection") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Не удалось подключиться"),
          ));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => News(value)));
        }
      });
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
      height: 570,
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
          child: Container(
              padding: EdgeInsets.only(top: 48, left: 30, right: 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Nickname",
                      style: TextStyle(color: const Color(0xFFCED0D5),
                          fontSize: 12, fontFamily: 'Roboto'),
                    ),
                  ),

                  TextField(
                    style: TextStyle(color: const Color(0xFF252627),
                    fontFamily: 'Roboto', fontSize: 14),
                    controller: _nicknameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-z]'))
                    ],
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 28),
                    child: Text("Password",
                      style: TextStyle(color: const Color(0xFFCED0D5),
                          fontSize: 12, fontFamily: 'Roboto'),
                    ),
                  ),

                  TextField(
                    obscureText: _isHidden,
                    obscuringCharacter: "*",
                    style: TextStyle(color: const Color(0xFF252627),
                        fontFamily: 'Roboto', fontSize: 14),
                    controller: _passwordController,
                    decoration: InputDecoration(
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
                    width: double.infinity,
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

                  Container(
                    padding: EdgeInsets.only(top: 30),
                    height: 51,
                    alignment: Alignment.centerLeft,
                    child: Text("Регистрируясь вы принимаете наши условия:",
                      style: TextStyle(color: const Color(0xFF4D545C),
                        fontSize: 12, fontFamily: 'Roboto'),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 1),
                    height: 19,
                    alignment: Alignment.centerLeft,
                    child: Text("политику использования данных",
                      style: TextStyle(color: const Color(0xFF0290E0),
                          fontSize: 12, fontFamily: 'Roboto',
                        decoration: TextDecoration.underline),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 1),
                    alignment: Alignment.centerLeft,
                    child: Text("политику в отношении файлов cookie",
                      style: TextStyle(color: const Color(0xFF0290E0),
                          fontSize: 12, fontFamily: 'Roboto',
                          decoration: TextDecoration.underline),
                    ),
                  )
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