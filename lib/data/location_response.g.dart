part of 'location_response.dart';

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      dest_id: json['dest_id'] as String,
      name: json['name'] as String,
      locale: json['locale'] as String,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'dest_id': instance.dest_id,
      'name': instance.name,
      'locale': instance.locale,
    };
