import 'package:fitness_app/news/news.dart';
import 'package:fitness_app/request/api.dart';
import 'package:fitness_app/sign_up/sign_up_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Authorisation extends StatelessWidget {
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();
  final signUpLogic = getSignInStore;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 137),
      height: 570,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40),
            topRight: const Radius.circular(4),
            bottomLeft: const Radius.circular(4),
            bottomRight: const Radius.circular(40),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 48, left: 30, right: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nickname",
                  style: TextStyle(
                    color: const Color(0xFFCED0D5),
                    fontSize: 12,
                  ),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (text) => getSignInStore.setNickName(text),
                  style: TextStyle(
                    color: const Color(0xFF252627),
                    fontSize: 14,
                  ),
                  controller: _nicknameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-z]'),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 28),
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: const Color(0xFFCED0D5),
                    fontSize: 12,
                  ),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (text) => getSignInStore.setPassword(text),
                  obscureText: signUpLogic.hide,
                  obscuringCharacter: "*",
                  style:
                      TextStyle(color: const Color(0xFF252627), fontSize: 14),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        signUpLogic.hide
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFFD1414F),
                      ),
                      onPressed: signUpLogic.hidePassword,
                    ),
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(9),
                    FilteringTextInputFormatter.deny(RegExp('[а-яА-Я]'))
                  ],
                ),
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
                      colors: [
                        const Color(0xFFBB4E75),
                        const Color(0xFFE74249)
                      ],
                    ),
                  ),
                  child: Observer(
                    builder: (_) => MaterialButton(
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: signUpLogic.isButtonEnabled
                          ? () {
                              Future<void> token = Api().refreshTokens();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => News(token.toString()),
                                ),
                              );
                            }
                          : null,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                height: 51,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Регистрируясь вы принимаете наши условия:",
                  style: TextStyle(
                      color: const Color(0xFF4D545C),
                      fontSize: 12,
                      fontFamily: 'Roboto'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 1),
                height: 19,
                alignment: Alignment.centerLeft,
                child: Text(
                  "политику использования данных",
                  style: TextStyle(
                      color: const Color(0xFF0290E0),
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 1),
                alignment: Alignment.centerLeft,
                child: Text(
                  "политику в отношении файлов cookie",
                  style: TextStyle(
                      color: const Color(0xFF0290E0),
                      fontSize: 12,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
  }
}
