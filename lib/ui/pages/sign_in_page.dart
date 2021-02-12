part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: Image.asset('assets/icon.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 40),
                  child: Text(
                    'Welcome Back,\nGengs!',
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: emailController,
                  onChanged: (text) {
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Email Address',
                      hintText: 'example : asep@mail.com'),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 6;
                    });
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'Forgot Password? ',
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Get Now',
                      style: purpleTextFont.copyWith(fontSize: 12),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 40, bottom: 30),
                    child: isSigningIn
                        ? SpinKitFadingCircle(
                            color: mainColor,
                          )
                        : FloatingActionButton(
                            elevation: 0,
                            child: Icon(
                              Icons.arrow_forward,
                              color: isEmailValid && isPasswordValid
                                  ? Colors.white
                                  : Color(0xFFBEBEBE),
                            ),
                            backgroundColor: isEmailValid && isPasswordValid
                                ? mainColor
                                : Color(0xFFE4E4E4),
                            onPressed: isEmailValid && isPasswordValid
                                ? () async {
                                    setState(() {
                                      isSigningIn = true;
                                    });

                                    SignInSignUpResult result =
                                        await AuthServices.signIn(
                                            emailController.text,
                                            passwordController.text);

                                    if (result.user == null) {
                                      setState(() {
                                        isSigningIn = false;
                                      });

                                      Flushbar(
                                        duration: Duration(seconds: 4),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Color(0xFFFF5383),
                                        message: result.message,
                                      )..show(context);
                                    }
                                  }
                                : null,
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
                      },
                      child: Text(
                        'Create new account',
                        style: purpleTextFont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
