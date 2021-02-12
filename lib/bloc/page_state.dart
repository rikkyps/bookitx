part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavbarIndex;
  final bool isExpired;

  OnMainPage({this.bottomNavbarIndex = 0, this.isExpired = false});
  @override
  List<Object> get props => [bottomNavbarIndex, isExpired];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnAccountConfirmPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;

  OnSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;

  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccessPage extends PageState {
  final Ticket ticket;
  final FlutixTransaction transaction;

  OnSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class OnTicketPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTicketDetailPage extends PageState {
  final Ticket tickets;

  OnTicketDetailPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}

class OnMyWalletPage extends PageState {
  final PageEvent pageEvent;

  OnMyWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class OnEditProfilePage extends PageState {
  final User user;

  OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
