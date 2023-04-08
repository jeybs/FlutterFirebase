part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class UserProfileLoaded extends HomeState {
  final UserData? userData;
  const UserProfileLoaded(this.userData);
}

class UserLogout extends HomeState {
 const UserLogout();
}

class UploadImageSuccess extends HomeState {
  final String path;
  const UploadImageSuccess(this.path);
}

class UploadImageFail extends HomeState {
  const UploadImageFail();
}

class UpdateUserProfilePhotoSuccess extends HomeState {
  const UpdateUserProfilePhotoSuccess();
}

class UpdateUserProfilePhotoFail extends HomeState {
  const UpdateUserProfilePhotoFail();
}

class SearchUserData extends HomeState {
  final UserData? userData;
  const SearchUserData(this.userData);
}

class ContactListLoading extends HomeState {
  const ContactListLoading();
}

class ContactListLoaded extends HomeState {
  final List<Contact> contactList;
  const ContactListLoaded(this.contactList);
}