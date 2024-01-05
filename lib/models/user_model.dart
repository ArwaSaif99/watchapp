class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String? city;

  final String? profileImage;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.city,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      city: json['city'] ?? '',
      mobile: json['mobile'] ?? '',
      profileImage: json['profile_image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'city': city,
      'profile_image': profileImage,
    };
  }
}
