part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.user.name;
    emailController.text = widget.user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToProfilePage());
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(top: 28),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToProfilePage());
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'Edit Your\nProfile',
                                style: blackTextFont.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
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
                                        image: widget.user.profilePicture !=
                                                null
                                            ? NetworkImage(
                                                widget.user.profilePicture)
                                            : AssetImage(
                                                'assets/holder_pictures.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      //DELETE IMAGE
                                    },
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(widget.user
                                                          .profilePicture !=
                                                      null
                                                  ? 'assets/btn_delete_pic.png'
                                                  : 'assets/btn_add_pic.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 31,
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
                            height: 27,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Email Address',
                                enabled: false),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30, top: 30),
                              width: 250,
                              height: 46,
                              child: RaisedButton(
                                child: Text('Change Password',
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: accentColor1,
                                onPressed: () {
                                  return AuthServices.resestPassword(
                                      emailController.text);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
