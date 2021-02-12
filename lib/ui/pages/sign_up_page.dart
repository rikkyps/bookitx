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
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 22,
                ),
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToSplashPage());
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Create New\nAccount',
                        style: blackTextFont.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                    height: 104,
                    width: 90,
                    child: Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (widget
                                              .registrationData.profileImage ==
                                          null)
                                      ? AssetImage('assets/holder_pictures.png')
                                      : FileImage(
                                          widget.registrationData.profileImage),
                                  fit: BoxFit.cover)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (widget.registrationData.profileImage ==
                                  null) {
                                File file = await getImage();
                                widget.registrationData.profileImage = file;
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
                                        widget.registrationData.profileImage ==
                                                null
                                            ? 'assets/btn_add_pic.png'
                                            : 'assets/btn_delete_pic.png')),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Confirm Password',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                backgroundColor: mainColor,
                elevation: 0,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  if (!(nameController.text.trim() != '' &&
                      emailController.text.trim() != '' &&
                      passwordController.text.trim() != '' &&
                      confirmPasswordController.text.trim() != '')) {
                    Flushbar(
                      duration: Duration(milliseconds: 1500),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Color(0xFFFF5C83),
                      message: 'Please fill all the fields',
                    )..show(context);
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    Flushbar(
                      duration: Duration(milliseconds: 1500),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Color(0xFFFF5C83),
                      message: 'Password confirmation is not match',
                    )..show(context);
                  } else if (passwordController.text.length < 6) {
                    Flushbar(
                      duration: Duration(milliseconds: 1500),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Color(0xFFFF5C83),
                      message: 'Password length min 6 char',
                    )..show(context);
                  } else if (!EmailValidator.validate(emailController.text)) {
                    Flushbar(
                      duration: Duration(milliseconds: 1500),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Color(0xFFFF5C83),
                      message: 'Wrong formatted mail address',
                    )..show(context);
                  } else {
                    widget.registrationData.name = nameController.text;
                    widget.registrationData.email = emailController.text;
                    widget.registrationData.password = passwordController.text;

                    context
                        .bloc<PageBloc>()
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
