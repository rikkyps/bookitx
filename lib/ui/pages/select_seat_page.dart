part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .bloc<PageBloc>()
            .add(GoToSelectSchedulePage(widget.ticket.movieDetail));
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
            ListView(
              children: [
                Column(
                  children: [
                    //HEADER
                    Row(
                      //BACK BUTTON
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToSelectSchedulePage(
                                      widget.ticket.movieDetail));
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        //POSTER
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 16),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    widget.ticket.movieDetail.title,
                                    style: blackTextFont.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.center,
                                  )),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(imageBaseURL +
                                            'w154' +
                                            widget
                                                .ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    //CINEMA SCREEN
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 85.1,
                      width: 278.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/cinema_screen.png'))),
                    ),
                    //SEATS
                    generateSeats(),
                    SizedBox(
                      height: 20,
                    ),
                    //KETERANGAN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                width: 18,
                                height: 18,
                                color: Color(0XFFE4E4E4),
                              ),
                              Text('Booked', style: blackTextFont.copyWith(fontSize: 12)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(border: Border.all(color: Color(0XFFE4E4E4), width: 1)),
                              ),
                              Text('Available', style: blackTextFont.copyWith(fontSize: 12)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                width: 18,
                                height: 18,
                                color: Color(0XFFFFD029),
                              ),
                              Text('Selected', style: blackTextFont.copyWith(fontSize: 12)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //BUTTON NEXT
                    Align(
                      alignment: Alignment.topCenter,
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: selectedSeats.length > 0
                            ? mainColor
                            : Color(0XFFE4E4E4),
                        child: Icon(
                          Icons.arrow_forward,
                          color: selectedSeats.length > 0
                              ? Colors.white
                              : Color(0XFFBEBEBE),
                        ),
                        onPressed: (selectedSeats.length > 0) ? () {
                          context.bloc<PageBloc>().add(GoToCheckoutPage(widget.ticket.copyWith(seats: selectedSeats)));
                        } : null,
                      ),
                    ),
                     SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          numberOfSeats[i],
          (index) => Padding(
            padding: EdgeInsets.only(
                right: index < numberOfSeats.length - 1 ? 16 : 0, bottom: 16),
            child: SelectableBox(
              '${String.fromCharCode(i + 65)}${index + 1}',
              width: 40,
              height: 40,
              textStyle: blackNumberFormat,
              isSelected: selectedSeats
                  .contains('${String.fromCharCode(i + 65)}${index + 1}'),
              onTap: () {
                String seatNumber =
                    '${String.fromCharCode(i + 65)}${index + 1}';
                setState(() {
                  if (selectedSeats.contains(seatNumber)) {
                    selectedSeats.remove(seatNumber);
                  } else {
                    selectedSeats.add(seatNumber);
                  }
                });
              },
              isEnable: index != 0,
            ),
          ),
        ),
      ));
    }

    return Column(
      children: widgets,
    );
  }
}
