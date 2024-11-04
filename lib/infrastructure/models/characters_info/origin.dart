import 'package:json_annotation/json_annotation.dart';

part 'origin.g.dart';

@JsonSerializable()
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  @override
  String toString() => 'Origin(name: $name, url: $url)';

  factory Origin.fromJson(Map<String, dynamic> json) {
    return _$OriginFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
