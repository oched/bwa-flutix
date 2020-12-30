part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .read<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 90),
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onTap: () {
                          context
                              .read<PageBloc>()
                              .add(GoToPreferencePage(widget.registrationData));
                        },
                      ),
                    ),
                    Center(
                        child: Text("Confirm\nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: (widget.registrationData.profileImage == null)
                          ? AssetImage("assets/user_pic.png")
                          : FileImage(widget.registrationData.profileImage),
                    )),
              ),
              Text("Welcome",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300)),
              Text(widget.registrationData.name,
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 110,
              ),
              (isSignUp)
                  ? SpinKitFadingCircle(
                      color: Color(0xFF3E9D9D),
                      size: 45,
                    )
                  : SizedBox(
                      height: 45,
                      width: 250,
                      child: RaisedButton(
                        color: Color(0xFF3E9D9D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text("Create My Account",
                            style: whiteTextFont.copyWith(fontSize: 16)),
                        onPressed: () async {
                          setState(() {
                            isSignUp = true;
                          });

                          imageFileToUpload =
                              widget.registrationData.profileImage;

                          SignInSignUpResult result = await AuthServices.signUp(
                              widget.registrationData.email,
                              widget.registrationData.password,
                              widget.registrationData.name,
                              widget.registrationData.selectedGenres,
                              widget.registrationData.selectedLanguage);

                          if (result == null) {
                            setState(() {
                              isSignUp = false;
                            });

                            showFLushTop(context, result.message);
                          }
                        },
                      ),
                    ),
              SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
