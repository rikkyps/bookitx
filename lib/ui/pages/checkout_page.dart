part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 36500 * widget.ticket.seats.length;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToselectSeatPage(widget.ticket));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(color: Colors.white),
            ),
            ListView(
              children: [
                Stack(
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
                                  .add(GoToselectSeatPage(widget.ticket));
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    //PAGE TITLE
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                      User user = (userState as UserLoaded).user;

                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Checkout\nMovie',
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          //MOVIE DESCRIPTION
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: defaultMargin, right: 20),
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(imageBaseURL +
                                            'w342' +
                                            widget
                                                .ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      child: Text(
                                        widget.ticket.movieDetail.title,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      )),
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        2 * defaultMargin -
                                        70 -
                                        20,
                                    margin: EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                        widget.ticket.movieDetail
                                            .genreAndLanguage,
                                        style: blackTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  RatingStars(
                                    voteAverage:
                                        widget.ticket.movieDetail.voteAverage,
                                    color: accentColor3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: defaultMargin),
                            child: Divider(
                              color: Color(0xFFE4E4E4),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order ID',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ticket.bookingCode,
                                  style: blackNumberFormat.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cinema',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.theater.name,
                                      style: blackNumberFormat.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.end,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date & Time',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  widget.ticket.time.dataAndTime,
                                  style: blackNumberFormat.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Seat Number',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    widget.ticket.seatToString,
                                    textAlign: TextAlign.end,
                                    style: blackNumberFormat.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  'IDR 35.000 x ${widget.ticket.seats.length}',
                                  style: blackNumberFormat.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Fees',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    'IDR 1.500 x ${widget.ticket.seats.length}',
                                    textAlign: TextAlign.end,
                                    style: blackNumberFormat.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 9),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(total),
                                  style: blackNumberFormat.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: defaultMargin),
                            child: Divider(
                              color: Color(0xFFE4E4E4),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Saldo Wallet',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id_ID',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(user.balance),
                                  style: blackNumberFormat.copyWith(
                                      color: user.balance >= total
                                          ? Color(0xFF3E9D9D)
                                          : Color(0xFFFF5C83),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 46,
                            margin: EdgeInsets.only(top: 36, bottom: 50),
                            child: RaisedButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: user.balance >= total
                                  ? Color(0xFF3E9D9D)
                                  : mainColor,
                              child: Text(
                                  user.balance >= total
                                      ? 'Checkout Now'
                                      : 'Top Up My Wallet',
                                  style: whiteTextFont.copyWith(fontSize: 16)),
                              onPressed: () {
                                if (user.balance >= total) {
                                  FlutixTransaction transaction =
                                      FlutixTransaction(
                                          userID: user.id,
                                          title:
                                              widget.ticket.movieDetail.title,
                                          subTitle: widget.ticket.theater.name,
                                          time: DateTime.now(),
                                          amount: -total,
                                          picture: widget
                                              .ticket.movieDetail.posterPath);
                                    context.bloc<PageBloc>().add(GoToSuccessPage(widget.ticket.copyWith(totalPrice: total), transaction));
                                } else {
                                  //Jika Uang Tidak Cukup
                                }
                              },
                            ),
                          )
                        ],
                      );
                    }),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
