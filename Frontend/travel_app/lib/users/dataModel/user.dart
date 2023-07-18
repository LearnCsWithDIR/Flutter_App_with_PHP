class User {
  int user_id = 10;
  late String user_firstName;
  late String user_email;
  late String user_phone;
  late String user_password;

  User(this.user_id, this.user_firstName, this.user_email, this.user_phone,
      this.user_password);
  // multiple constructors for want to use  ( class.another_name )
  User.u1();

  // convert to Json format for registration users
  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_firstname': user_firstName.toString(),
        'user_email': user_email.toString(),
        'user_phone': user_phone.toString(),
        'user_password': user_password.toString(),
      };
}
