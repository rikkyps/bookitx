part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
            future: ticket != null
                ? processingTicketOrder(context)
                : processingTopUp(context),
            builder: (_, snapshot) =>
                (snapshot.connectionState == ConnectionState.done)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ticket == null
                                        ? AssetImage('assets/success_topup.png')
                                        : AssetImage(
                                            'assets/success_buyticket.png'))),
                          ),
                          Text(
                            ticket == null
                                ? 'Yeeaayy Congratulation!'
                                : 'Happy Watching!',
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            ticket == null
                                ? 'You have successfully top up your wallet'
                                : 'You have successful;ly bought the tickets',
                            style: greyTextFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 70, bottom: 15),
                            height: 45,
                            width: 250,
                            child: RaisedButton(
                              child: Text(
                                ticket == null ? 'My Wallet' : 'My Tickets',
                                style: whiteTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              color: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                if (ticket == null) {
                                  context
                                      .bloc<PageBloc>()
                                      .add((GoToMyWalletPage(GoToMainPage())));
                                } else {
                                  context.bloc<PageBloc>().add(GoToMainPage(bottomNavbarIndex: 1));
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Discover New Movie? ',
                                  style: blackTextFont.copyWith(fontSize: 14)),
                              GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(GoToMainPage());
                                },
                                child: Text('Back Home',
                                    style: purpleTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      )
                    : Center(
                        child: SpinKitFadingCircle(size: 50, color: mainColor),
                      )),
      ),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(
    BuildContext context,
  ) async {
    context.bloc<UserBloc>().add(TopUp(transaction.amount));

    await FlutixTransactionServices.saveTransaction(transaction);
  }
}
