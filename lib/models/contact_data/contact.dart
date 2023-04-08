import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@Freezed()
class Contact with _$Contact {

  const factory Contact({
    @Default(null) UserData? userData,
    @JsonKey(name: 'last_message') @Default("") String lastMessage,
    @JsonKey(name: 'last_message_date') @Default("") String lastMessageDate,
    @JsonKey(name: 'from_id') @Default("") String fromId,
    @JsonKey(name: 'to_id') @Default("")  String toId,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object?> json) => _$ContactFromJson(json);
}