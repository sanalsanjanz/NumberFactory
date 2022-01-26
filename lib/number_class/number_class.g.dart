// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberClass _$NumberClassFromJson(Map<String, dynamic> json) => NumberClass(
      text: json['text'] as String?,
      number: json['number'] as int?,
      found: json['found'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NumberClassToJson(NumberClass instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
      'found': instance.found,
      'type': instance.type,
    };
