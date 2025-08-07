class AppUser {
  String name;
  String email;
  String streetAndNumber;
  String zipCode;
  String city;

  AppUser(this.name, this.email, this.streetAndNumber, this.zipCode, this.city);

  // Zu Firebase --> Zu JSON/Zu Map

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'streetAndNumber': streetAndNumber,
      'zipCode': zipCode,
      'city': city,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      (map['name'] ?? '') as String,
      map['email'] ?? '',
      map['streetAndNumber'] ?? '',
      map['zipCode'] ?? '',
      map['city'] ?? '',
    );
  }

  // Von Firebase (JSON) --> AppUser
}
