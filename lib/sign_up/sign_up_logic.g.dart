// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_logic.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpLogic on _SignUpLogic, Store {
  Computed<String>? _$_nicknameComputed;

  @override
  String get _nickname =>
      (_$_nicknameComputed ??= Computed<String>(() => super._nickname,
              name: '_SignUpLogic._nickname'))
          .value;
  Computed<String>? _$_passwordComputed;

  @override
  String get _password =>
      (_$_passwordComputed ??= Computed<String>(() => super._password,
              name: '_SignUpLogic._password'))
          .value;
  Computed<bool>? _$isButtonEnabledComputed;

  @override
  bool get isButtonEnabled =>
      (_$isButtonEnabledComputed ??= Computed<bool>(() => super.isButtonEnabled,
              name: '_SignUpLogic.isButtonEnabled'))
          .value;

  final _$nicknameAtom = Atom(name: '_SignUpLogic.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpLogic.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$hideAtom = Atom(name: '_SignUpLogic.hide');

  @override
  bool get hide {
    _$hideAtom.reportRead();
    return super.hide;
  }

  @override
  set hide(bool value) {
    _$hideAtom.reportWrite(value, super.hide, () {
      super.hide = value;
    });
  }

  final _$_SignUpLogicActionController = ActionController(name: '_SignUpLogic');

  @override
  void hidePassword() {
    final _$actionInfo = _$_SignUpLogicActionController.startAction(
        name: '_SignUpLogic.hidePassword');
    try {
      return super.hidePassword();
    } finally {
      _$_SignUpLogicActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nickname: ${nickname},
password: ${password},
hide: ${hide},
isButtonEnabled: ${isButtonEnabled}
    ''';
  }
}
