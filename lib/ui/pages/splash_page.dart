part of 'pages.dart';

class SplashPage extends StatelessWidget {
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
                  image: DecorationImage(image: AssetImage('assets/icon.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 12),
                child: Text(
                  'New Experience',
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Watch a movie become \n esier than any before',
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 45,
                margin: EdgeInsets.only(top: 70, bottom: 15),
                child: RaisedButton(
                  child: Text(
                    'Get Started',
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  color: mainColor,
                  onPressed: () {
                    context.bloc<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text('Sign in', style: purpleTextFont))
                ],
              )
            ]),
      ),
    );
  }
}
