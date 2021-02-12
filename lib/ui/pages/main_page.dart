part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNabarIndex;
  final bool isExpired;

  MainPage({this.bottomNabarIndex = 0, this.isExpired = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int buttonNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    buttonNavBarIndex = widget.bottomNabarIndex;
    pageController = PageController(initialPage: buttonNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: accentColor1,
        ),
        SafeArea(
          child: Container(
            color: Color(0xFFF6F7F9),
          ),
        ),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              buttonNavBarIndex = index;
            });
          },
          children: [
            MoviePage(),
            TicketPage(
              isExpiredTicket: widget.isExpired,
            )
          ],
        ),
        customButtonNavBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 46,
            height: 46,
            margin: EdgeInsets.only(bottom: 42),
            child: FloatingActionButton(
              backgroundColor: accentColor2,
              elevation: 0,
              onPressed: () {
                context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
              },
              child: SizedBox(
                height: 26,
                width: 26,
                child: Icon(
                  MdiIcons.walletPlus,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget customButtonNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: buttonNavBarIndex,
              onTap: (index) {
                setState(() {
                  buttonNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    title: Text(
                      'New Movies',
                      style: GoogleFonts.raleway(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                      height: 20,
                      margin: EdgeInsets.only(bottom: 6),
                      child: Image.asset((buttonNavBarIndex == 0)
                          ? 'assets/ic_movies_selected.png'
                          : 'assets/ic_movies_unselected.png'),
                    )),
                BottomNavigationBarItem(
                    title: Text(
                      'My Tickets',
                      style: GoogleFonts.raleway(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                      height: 20,
                      margin: EdgeInsets.only(bottom: 6),
                      child: Image.asset((buttonNavBarIndex == 1)
                          ? 'assets/ic_ticket_selected.png'
                          : 'assets/ic_ticket_unselected.png'),
                    ))
              ],
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
