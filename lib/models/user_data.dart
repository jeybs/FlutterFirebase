class UserData {

  String name = "";
  String mobile = "";

  UserData({required this.name, required this.mobile});

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
    name: json['name'],
    mobile: json['mobile']
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile
    };
  }
}