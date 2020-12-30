part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserFlutix convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          double balance = 50000}) =>
      UserFlutix(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<UserFlutix> fromFireStore() async => await UserServices.getUser(this.uid);
}
