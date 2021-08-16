import 'package:mobx/mobx.dart';

part 'sign_up_logic.g.dart';

class SignUpLogic = _SignUpLogic with _$SignUpLogic;

abstract class _SignUpLogic with Store {
  @observable
  String nickname = '';

  @observable
  String password = '';

  void setNickName(String outSideText) {
    nickname = outSideText;
  }

  void setPassword(String outSideText) {
    password = outSideText;
  }

  @observable
  bool hide = true;

  @computed
  String get _nickname => this.nickname;

  @computed
  String get _password => this.password;

  @computed
  bool get isButtonEnabled =>
      this.nickname.length > 3 && this.password.length > 3;

  @action
  void hidePassword() {
    hide = !hide;
  }
}

SignUpLogic singleton = SignUpLogic();

SignUpLogic get getSignInStore => singleton;
