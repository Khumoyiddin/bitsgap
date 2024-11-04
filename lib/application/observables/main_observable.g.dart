// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainObservable on MainObservableBase, Store {
  late final _$likesAtom =
      Atom(name: 'MainObservableBase.likes', context: context);

  @override
  ObservableMap<String, bool> get likes {
    _$likesAtom.reportRead();
    return super.likes;
  }

  @override
  set likes(ObservableMap<String, bool> value) {
    _$likesAtom.reportWrite(value, super.likes, () {
      super.likes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'MainObservableBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$charactersInfoAtom =
      Atom(name: 'MainObservableBase.charactersInfo', context: context);

  @override
  CharactersInfo get charactersInfo {
    _$charactersInfoAtom.reportRead();
    return super.charactersInfo;
  }

  bool _charactersInfoIsInitialized = false;

  @override
  set charactersInfo(CharactersInfo value) {
    _$charactersInfoAtom.reportWrite(
        value, _charactersInfoIsInitialized ? super.charactersInfo : null, () {
      super.charactersInfo = value;
      _charactersInfoIsInitialized = true;
    });
  }

  late final _$changeLikeStateAsyncAction =
      AsyncAction('MainObservableBase.changeLikeState', context: context);

  @override
  Future<void> changeLikeState(String characterId) {
    return _$changeLikeStateAsyncAction
        .run(() => super.changeLikeState(characterId));
  }

  late final _$getCharactersInfoAsyncAction =
      AsyncAction('MainObservableBase.getCharactersInfo', context: context);

  @override
  Future<void> getCharactersInfo() {
    return _$getCharactersInfoAsyncAction.run(() => super.getCharactersInfo());
  }

  late final _$MainObservableBaseActionController =
      ActionController(name: 'MainObservableBase', context: context);

  @override
  void setLikes(Map<String, bool> newLikes) {
    final _$actionInfo = _$MainObservableBaseActionController.startAction(
        name: 'MainObservableBase.setLikes');
    try {
      return super.setLikes(newLikes);
    } finally {
      _$MainObservableBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
likes: ${likes},
isLoading: ${isLoading},
charactersInfo: ${charactersInfo}
    ''';
  }
}
