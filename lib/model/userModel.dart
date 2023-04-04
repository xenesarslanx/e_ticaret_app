class User {
  String? ad;
  String? yas;

  User(this.ad, this.yas); 

   Map<String, dynamic> toMap() {
    return {
      'ad': ad,
      'yas': yas,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      map['ad'],
      map['yas'],
    );
  }
}