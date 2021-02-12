part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedlang;
  File profileImage;

  RegistrationData(
      {this.name = '',
      this.email = '',
      this.password = '',
      this.selectedGenres = const [],
      this.selectedlang = '',
      this.profileImage});
}
