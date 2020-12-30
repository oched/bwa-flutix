part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User fireBaseUser = Provider.of<User>(context);

    if (fireBaseUser == null) {
      if (!(prevPageEvent is GoToWelcomePage)) {
        prevPageEvent = GoToWelcomePage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.watch<UserBloc>().add(LoadUser(fireBaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnWelcomePage)
          ? WelcomePage()
          : (pageState is OnLoginPage)
              ? SignInPage()
              : (pageState is OnRegistrationPage)
                  ? SignUpPage(pageState.registrationData)
                  : (pageState is OnPrefrerencePage)
                      ? PreferencePage(pageState.registrationData)
                      : (pageState is OnAccountConfirmationPage)
                          ? AccountConfirmationPage(pageState.registrationData)
                          : (pageState is OnMovieDetailPage)
                              ? MovieDetailPage(pageState.movie)
                              : MainPage(),
    );
  }
}
