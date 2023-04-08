import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/utils/time_serializer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@Freezed()
class Contact with _$Contact {

  const factory Contact({
    @Default(null) UserData? userData,
    @JsonKey(name: 'date_added') @Default("") String dateAdded,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object?> json) => _$ContactFromJson(json);
}