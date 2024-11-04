import 'package:json_annotation/json_annotation.dart';

import 'info.dart';
import 'result.dart';

part 'characters_info.g.dart';

@JsonSerializable()
class CharactersInfo {
  Info? info;
  List<Result>? results;

  CharactersInfo({this.info, this.results});

  @override
  String toString() => 'CharactersInfo(info: $info, results: $results)';

  factory CharactersInfo.fromJson(Map<String, dynamic> json) {
    return _$CharactersInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CharactersInfoToJson(this);
}
