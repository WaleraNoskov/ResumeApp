class ResumeEntity {
  final int id;

  final String firstName;
  final String lastName;
  final String surname;

  final int phone;
  final String email;
  final String socialLink;

  final String function;
  final int salary;
  final String employment;
  final String sheldue;

  final String city;
  final String country;
  final String birthday;
  final String family;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'surname': surname,
      'phone': phone,
      'email': email,
      'socialLink': socialLink,
      'function': function,
      'salary': salary,
      'employment': employment,
      'sheldue': sheldue,
      'city': city,
      'country': country,
      'birthday': birthday,
      'family': family
    };
  }

  @override
  String toString() {
    return 'Resume: {Name: $firstName $lastName $surname - $function, $salary}';
  }

  ResumeEntity(
      this.id,
      this.firstName,
      this.lastName,
      this.surname,
      this.phone,
      this.email,
      this.socialLink,
      this.function,
      this.salary,
      this.employment,
      this.sheldue,
      this.city,
      this.country,
      this.birthday,
      this.family);
}
