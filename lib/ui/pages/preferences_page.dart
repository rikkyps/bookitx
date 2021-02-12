part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData registrasionData;
  final List<String> genres = [
    'Horror',
    'Music',
    'Action',
    'Drama',
    'Champion',
    'Comedy',
  ];

  final List<String> language = ['English', 'Bahasa', 'Japanese', 'Korean'];

  PreferencePage(this.registrasionData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrasionData.password = '';
        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrasionData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 4,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          widget.registrasionData.password = '';
                          context.bloc<PageBloc>().add(
                              GoToRegistrationPage(widget.registrasionData));
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Text(
                    'Select Your\nFavorite Genres',
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateGenreWidgets(context)),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Select Language',
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLangWidget(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: mainColor,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (selectedGenres.length != 4) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: 'Please select 4 genres',
                          )..show(context);
                        } else {
                          widget.registrasionData.selectedGenres =
                              selectedGenres;
                          widget.registrasionData.selectedlang =
                              selectedLanguage;

                          context.bloc<PageBloc>().add(
                              GoToAccountConfirmPage(widget.registrasionData));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 50)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLangWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.language
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
