part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Container(
            margin: EdgeInsets.only(
                left: defaultMargin, top: 44, right: defaultMargin),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              User user = (userState as UserLoaded).user;
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 29,
                      height: 29,
                      child: GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToMainPage());
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 10),
                        child: SpinKitFadingCircle(
                          color: mainColor,
                          size: 50,
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: user.profilePicture == '' ? NetworkImage(user.profilePicture) : AssetImage('assets/holder_pictures.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      user.name,
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    user.email,
                    style: greyTextFont.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //EDIT PROFILE MENU
                  Container(
                    height: 40,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToEditProfilePage((userState as UserLoaded).user));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/account_box.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Edit Profile',
                                style: blackTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  ),
                  //MY WALLET MENU
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .bloc<PageBloc>()
                                .add(GoToMyWalletPage(GoToProfilePage()));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/wallet.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'My Wallet',
                                style: blackTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  ),
                  //CHANGE LANGUAGE
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/translate.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Language',
                              style: blackTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  ),
                  //MY WALLET MENU
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/contact.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Help Center',
                              style: blackTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  ),
                  //MY WALLET MENU
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/like.png'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Rate Flutix Apps',
                              style: blackTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  ),
                  //MY WALLET MENU
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 14),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                            AuthServices.signOut();
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/logout.png'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Logout',
                                style: blackTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        generateDashedDivider(
                            MediaQuery.of(context).size.width -
                                2 * defaultMargin)
                      ],
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }
}
