// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_items_logic.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsItemsLogic on _NewsItemsLogic, Store {
  final _$firstNameAtom = Atom(name: '_NewsItemsLogic.firstName');

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_NewsItemsLogic.lastName');

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$captionAtom = Atom(name: '_NewsItemsLogic.caption');

  @override
  String? get caption {
    _$captionAtom.reportRead();
    return super.caption;
  }

  @override
  set caption(String? value) {
    _$captionAtom.reportWrite(value, super.caption, () {
      super.caption = value;
    });
  }

  final _$buttonLikeAtom = Atom(name: '_NewsItemsLogic.buttonLike');

  @override
  List<bool> get buttonLike {
    _$buttonLikeAtom.reportRead();
    return super.buttonLike;
  }

  @override
  set buttonLike(List<bool> value) {
    _$buttonLikeAtom.reportWrite(value, super.buttonLike, () {
      super.buttonLike = value;
    });
  }

  final _$currentNewsAtom = Atom(name: '_NewsItemsLogic.currentNews');

  @override
  List<NewsData> get currentNews {
    _$currentNewsAtom.reportRead();
    return super.currentNews;
  }

  @override
  set currentNews(List<NewsData> value) {
    _$currentNewsAtom.reportWrite(value, super.currentNews, () {
      super.currentNews = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
caption: ${caption},
buttonLike: ${buttonLike},
currentNews: ${currentNews}
    ''';
  }
}
