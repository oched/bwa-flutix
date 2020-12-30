part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  static Future<void> updateUser(UserFlutix user) {
    userCollection.doc(user.id).set({
      "email": user.email,
      "name": user.name,
      "balance": user.balance,
      "selectedGenres": user.selectedGenres,
      "selectedLanguage": user.selectedLanguage,
      "profilePicture": user.profilePicturePath ?? ""
    });
  }

  static Future<UserFlutix> getUser(String id) async {
    DocumentSnapshot snapshot = await userCollection.doc(id).get();

    return UserFlutix(id, snapshot.get("email"),
        balance: snapshot.get("balance"),
        profilePicturePath: snapshot.get("profilePicture"),
        selectedGenres: (snapshot.get("selectedGenres") as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.get("selectedLanguage"),
        name: snapshot.get("name"));
  }
}
