import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_data.freezed.dart';
part 'contact_data.g.dart';

@Freezed()
class ContactData with _$ContactData {

  const factory ContactData({
    @JsonKey(name: 'date_added') @Default("") String date_added,
  }) = _ContactData;

  factory ContactData.fromJson(Map<String, Object?> json) => _$ContactDataFromJson(json);
}