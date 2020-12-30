part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text(
                  "New Experience",
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Watch a new movie much\neasier than any before",
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w200),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 45,
                margin: EdgeInsets.only(top: 70, bottom: 20),
                child: RaisedButton(
                    child: Text(
                      "Get Started",
                      style: whiteTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w200),
                    ),
                    color: mainColor,
                    onPressed: () {
                      context
                          .read<PageBloc>()
                          .add(GoToRegistrationPage(RegistrationData()));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: greyTextFont,
                  ),
                  GestureDetector(
                    child: Text("Sign In", style: purpleTextFont),
                    onTap: () {
                      context.read<PageBloc>().add(GoToLoginPage());
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}
