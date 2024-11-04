import 'dart:convert';
import 'package:bitsgap_tt/infrastructure/main_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bitsgap_tt/infrastructure/models/characters_info/characters_info.dart';

part 'main_observable.g.dart';

class MainObservable = MainObservableBase with _$MainObservable;

abstract class MainObservableBase with Store {
  @observable
  ObservableMap<String, bool> likes = ObservableMap<String, bool>();

  @observable
  bool isLoading = false;

  @observable
  bool isFailed = false;

  @observable
  late String errorMessage;

  @observable
  late CharactersInfo charactersInfo;

  MainObservableBase() {
    getCharactersInfo();
  }

  @action
  Future<void> changeLikeState(String characterId) async {
    likes.update(characterId, (value) => !value, ifAbsent: () => true);
    await _saveLikesToPrefs();
  }

  @action
  Future<void> getCharactersInfo() async {
    isLoading = true;
    final result = await MainRepository().fetchCharactersInfo();
    result.fold(
      (failure) {
        isLoading = false;
        isFailed = true;
        errorMessage = failure;
      },
      (success) async {
        await _loadLikes();
        isLoading = false;
        isFailed = false;
        charactersInfo = success;
      },
    );
  }

  @action
  void setLikes(Map<String, bool> newLikes) {
    likes = ObservableMap.of(newLikes);
  }

  Future<void> _saveLikesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('storedLikes', jsonEncode(likes));
  }

  Future<void> _loadLikes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('storedLikes');
    if (jsonString != null) {
      final Map<String, dynamic> decodedMap = jsonDecode(jsonString);
      final loadedMap = decodedMap.map((key, value) => MapEntry(key, value as bool));

      setLikes(loadedMap);
    }
  }
}
