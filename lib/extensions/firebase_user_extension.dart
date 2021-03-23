part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser(
          {String name = 'No Name',
          List<String> selectedGenre = const [],
          String selectedLang = 'English',
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          selectedGenre: selectedGenre,
          selectedLang: selectedLang,
          balance: balance);

  Future<User> formFiresStore() async => await UserServices.getUser(this.uid);
}
