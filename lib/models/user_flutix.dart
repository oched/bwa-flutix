part of 'models.dart';

class UserFlutix extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicturePath;
  final String selectedLanguage;
  final List<String> selectedGenres;
  final double balance;

  UserFlutix(this.id, this.email,
      {this.name,
      this.profilePicturePath,
      this.balance,
      this.selectedGenres,
      this.selectedLanguage});

  UserFlutix copyWith({String name, String profilePicture, double balance}) =>
      UserFlutix(this.id, this.email,
          name: name ?? this.name,
          profilePicturePath: profilePicture ?? this.profilePicturePath,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicturePath,
        selectedGenres,
        selectedLanguage,
        balance
      ];

  @override
  String toString() {
    return "[$id] - $name, $email";
  }
}
