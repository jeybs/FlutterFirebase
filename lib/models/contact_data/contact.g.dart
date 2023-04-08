// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$$_ContactFromJson(Map<String, dynamic> json) => _$_Contact(
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      dateAdded: json['date_added'] as String? ?? "",
    );

Map<String, dynamic> _$$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'date_added': instance.dateAdded,
    };
