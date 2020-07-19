class TestUser {
  String firstName;
  String lastName;
  String email;
  String password;
  int age;
  String gender;
  String city;
  String image;

  TestUser(this.firstName, this.lastName, this.email, this.password, this.age,
      this.gender, this.city, this.image);

  // User(this.firstName, this.lastName, this.email, this.password, this.age,
  //     this.gender, this.city, this.image);

  static List<TestUser> userList() => [
        TestUser("First", "Last", "example@name.com", "password", 21, "Male",
            "Toronto", "assets/images/mascot.png"),
        TestUser("First", "Last", "example@name.com", "password", 21, "Male",
            "Toronto", "assets/images/mascot.png"),
        TestUser("First", "Last", "example@name.com", "password", 21, "Male",
            "Toronto", "assets/images/mascot.png"),
        TestUser("First", "Last", "example@name.com", "password", 21, "Male",
            "Toronto", "assets/images/mascot.png"),
      ];
}
