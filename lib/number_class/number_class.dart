import 'package:json_annotation/json_annotation.dart';

part 'number_class.g.dart';

@JsonSerializable()
class NumberClass {
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'number')
  int? number;
  @JsonKey(name: 'found')
  bool? found;
  @JsonKey(name: 'type')
  String? type;

  NumberClass({this.text, this.number, this.found, this.type});

  factory NumberClass.fromJson(Map<String, dynamic> json) {
    return _$NumberClassFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberClassToJson(this);
}
