part of 'models.dart';

class ProfileCredit extends Equatable {
  final String name;
  final String profilePath;

  ProfileCredit({this.name, this.profilePath});

  @override
  List<Object> get props => [name, profilePath];
}
