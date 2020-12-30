part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .watch<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToWelcomePage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 22),
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
                          context.read<PageBloc>().add(GoToWelcomePage());
                        },
                      ),
                    ),
                    Center(
                        child: Text("Create New\nAccount",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center))
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 90,
                  height: 104,
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (widget.registrationData.profileImage ==
                                        null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            if (widget.registrationData.profileImage == null) {
                              widget.registrationData.profileImage =
                                  await getImage();
                            } else {
                              widget.registrationData.profileImage = null;
                            }

                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        (widget.registrationData.profileImage ==
                                                null)
                                            ? "assets/btn_add_photo.png"
                                            : "assets/btn_remove_photo.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Full Name"),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Email"),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Password"),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                controller: passwordConfirmationController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Confirm Password"),
              ),
              SizedBox(height: 30),
              FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                backgroundColor: mainColor,
                elevation: 0,
                onPressed: () {
                  if (nameController.text.trim() == "" &&
                      emailController.text.trim() == "" &&
                      passwordController.text.trim() == "" &&
                      passwordConfirmationController.text.trim() == "") {
                    showFLushTop(context, "Please fill all fields");
                  } else if (!EmailValidator.validate(emailController.text)) {
                    showFLushTop(context, "Invalid email format");
                  } else if (passwordController.text !=
                      passwordConfirmationController.text) {
                    showFLushTop(
                        context, "Mismatch password and password confirmation");
                  } else if (passwordController.text.length < 6) {
                    showFLushTop(context, "Password's length min 6 characters");
                  } else {
                    widget.registrationData.name = nameController.text;
                    widget.registrationData.email = emailController.text;
                    widget.registrationData.password = passwordController.text;

                    context
                        .read<PageBloc>()
                        .add(GoToPreferencePage(widget.registrationData));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
