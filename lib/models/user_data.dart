class UserData {

  String name = "";
  String mobile = "";
  String photo = "";

  UserData({required this.name, required this.mobile, required this.photo});

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    name: json['name'],
    mobile: json['mobile'],
    photo: json.containsKey('photo') ? json['photo'] : "",
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'photo': photo
    };
  }
}