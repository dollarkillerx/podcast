// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GResponse _$GResponseFromJson(Map<String, dynamic> json) => GResponse(
      (json['errors'] as List<dynamic>?)
          ?.map((e) => GError.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GResponseToJson(GResponse instance) => <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };

GError _$GErrorFromJson(Map<String, dynamic> json) => GError(
      json['message'] as String,
      (json['path'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GErrorToJson(GError instance) => <String, dynamic>{
      'message': instance.message,
      'path': instance.path,
    };

GErrorItem _$GErrorItemFromJson(Map<String, dynamic> json) => GErrorItem(
      json['code'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$GErrorItemToJson(GErrorItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
