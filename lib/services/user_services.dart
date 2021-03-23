part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    // String genres = '';

    // for(var genre in user.selectedGenre) {
    //   genres += genre + ((genre != user.selectedGenre.last) ? ',' : '');
    // }

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenre,
      'selectedLang': user.selectedLang,
      'profilePicture': user.profilePicture ?? ''
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(
      id,
      snapshot.data()['email'],
      balance: snapshot.data()['balance'],
      profilePicture: snapshot.data()['profilePicture'],
      selectedGenre: (snapshot.data()['selectedGenres'] as List).map((e) => e.toString()).toList(),
      selectedLang: snapshot.data()['snapshotLang'],
      name: snapshot.data()['name']
    );
  }
}
