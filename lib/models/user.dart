part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenre;
  final String selectedLang;
  final int balance;

  User(
    this.id,
    this.email, {
    this.name,
    this.profilePicture,
    this.selectedGenre,
    this.selectedLang,
    this.balance,
  });

  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenre: selectedGenre,
          selectedLang: selectedLang);

  @override
  String toString() {
    return '[$id] - $name, $email';
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, email, name, profilePicture, selectedGenre, selectedLang, balance];
}
