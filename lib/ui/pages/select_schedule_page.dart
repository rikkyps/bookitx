part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectSchedulePage(this.movieDetail);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));
          return;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: mainColor,
              ),
              SafeArea(
                child: Container(
                  color: Colors.white,
                ),
              ),
              ListView(
                children: [
                  //BACK BUTTON
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .bloc<PageBloc>()
                                .add(GoToMovieDetailPage(widget.movieDetail));
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  //TEXT
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 16),
                    child: Text(
                      'Choose Date',
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //CHOOSE DATE
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin : 0,
                            right: (index < dates.length - 1)
                                ? 16
                                : defaultMargin),
                        child: DateCard(
                          dates[index],
                          isSelected: selectedDate == dates[index],
                          onTap: () {
                            setState(() {
                              selectedDate = dates[index];
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  //SELECT THEATER
                  generateTimeTable(),
                  //BUTTON NEXT
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => FloatingActionButton(
                          elevation: 0,
                          backgroundColor:
                              isValid ? mainColor : Color(0XFFE4E4E4),
                          child: Icon(Icons.arrow_forward,
                              color: isValid ? Colors.white : Color(0XFFBEBEBE)),
                          onPressed: () {
                            if (isValid) {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToselectSeatPage(Ticket(
                                      widget.movieDetail,
                                      selectedTheater,
                                      DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedDate.hour,
                                      ),
                                      randomAlphaNumeric(12).toUpperCase(),
                                      null,
                                      (userState as UserLoaded).user.name,
                                      null)));
                            }
                          },
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Column generateTimeTable() {
    List<int> schedules = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child:
              Text(theater.name, style: blackTextFont.copyWith(fontSize: 20))));

      widgets.add(Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          itemCount: schedules.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Container(
            margin: EdgeInsets.only(
                left: (index == 0) ? defaultMargin : 0,
                right: (index < schedules.length - 1) ? 16 : defaultMargin),
            child: SelectableBox(
              '${schedules[index]}:00',
              height: 50,
              isSelected: selectedTheater == theater &&
                  selectedTime == schedules[index],
              isEnable: schedules[index] > DateTime.now().hour ||
                  selectedDate.day != DateTime.now().day,
              onTap: () {
                setState(() {
                  selectedTheater = theater;
                  selectedTime = schedules[index];
                  isValid = true;
                });
              },
            ),
          ),
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
