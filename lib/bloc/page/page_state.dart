part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props {}
}

class OnWelcomePage extends PageState {
  @override
  List<Object> get props {}
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props {}
}

class OnMainPage extends PageState {
  @override
  List<Object> get props {}
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props {}
}

class OnPrefrerencePage extends PageState {
  final RegistrationData registrationData;

  OnPrefrerencePage(this.registrationData);

  @override
  List<Object> get props {}
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props {}
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}
