class UserModel {
  final String email, firstName, lastName, avatar;

  // constructor untuk inisialisasi UserModel dengan email, firstName, lastName, dan avatar
  // sesuai dengan struktur JSON
  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  // factory method untuk membuat UserModel dari JSON, mengambil nilai dari JSON
  // dan mengembalikannya sebagai instance UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
