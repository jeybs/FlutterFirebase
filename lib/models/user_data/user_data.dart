
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@Freezed()
class UserData with _$UserData {

  const factory UserData({
    @Default("") String name,
    @Default("") String mobile,
    @Default("") String photo,
    @Default("") String email,
    @Default("") String uid
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) => _$UserDataFromJson(json);
}