part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        context.bloc<TicketBloc>().add(GetTickets(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmPage)
                            ? AccountConfimPage(pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetail)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticket)
                                        : (pageState is OnCheckoutPage)
                                            ? CheckoutPage(pageState.ticket)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState is OnTicketPage)
                                                    ? TicketPage()
                                                    : (pageState
                                                            is OnTicketDetailPage)
                                                        ? TicketDetailPage(
                                                            pageState.tickets)
                                                        : (pageState
                                                                is OnProfilePage)
                                                            ? ProfilePage()
                                                            : (pageState
                                                                    is OnTopUpPage)
                                                                ? TopUpPage(
                                                                    pageState
                                                                        .pageEvent)
                                                                : (pageState
                                                                        is OnMyWalletPage)
                                                                    ? MyWalletPage(
                                                                        pageState
                                                                            .pageEvent)
                                                                    : (pageState
                                                                            is OnEditProfilePage)
                                                                        ? EditProfilePage(
                                                                            pageState.user)
                                                                        : MainPage(
                                                                            bottomNabarIndex:
                                                                                (pageState as OnMainPage).bottomNavbarIndex,
                                                                            isExpired:
                                                                                (pageState as OnMainPage).isExpired,
                                                                          ));
  }
}
