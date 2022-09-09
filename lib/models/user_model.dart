class UserModel {
  String firstName;
  String lastName;
  String email;
  String sex;
  String preference;
  String phoneNumber;
  String profilePhoto;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.sex,
    required this.preference,
    required this.phoneNumber,
    required this.profilePhoto,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'profilePhoto': profilePhoto,
      'sex': sex,
      'preference': preference,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      profilePhoto: map['profilePhoto'],
      preference: map['preference'],
      sex: map['sex'],
    );
  }
}
