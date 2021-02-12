part of 'pages.dart';

class AccountConfimPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfimPage(this.registrationData);

  @override
  _AccountConfimPageState createState() => _AccountConfimPageState();
}

class _AccountConfimPageState extends State<AccountConfimPage> {
  bool isSigninIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: ListView(children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 90,
                    ),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToPreferencePage(widget.registrationData));
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Confirm New\nAccount',
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage('assets/holder_pictures.png')
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Welcome',
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.registrationData.email,
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.registrationData.name,
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigninIn)
                      ? SpinKitFadingCircle(size: 45, color: Color(0xFF3E9D97))
                      : SizedBox(
                          height: 45,
                          width: 250,
                          child: RaisedButton(
                            color: Color(0xFF3E9D97),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text('Create My Account',
                                style: whiteTextFont.copyWith(fontSize: 16)),
                            onPressed: () async {
                              setState(() {
                                isSigninIn = true;
                              });

                              imageFileToUpload =
                                  widget.registrationData.profileImage;

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name,
                                      widget.registrationData.selectedGenres,
                                      widget.registrationData.selectedlang);

                              if (result.user == null) {
                                setState(() {
                                  isSigninIn = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: result.message,
                                )..show(context);
                              }
                            },
                          ))
                ],
              ),
            ]),
          ),
        ));
  }
}
