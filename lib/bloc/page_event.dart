part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavbarIndex;
  final bool isExpired;

  GoToMainPage({this.bottomNavbarIndex = 0, this.isExpired = false});
  @override
  List<Object> get props => [bottomNavbarIndex, isExpired];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToAccountConfirmPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;

  GoToMovieDetailPage(this.movie);

  @override
  List<Object> get props => [movie];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;

  GoToSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GoToselectSeatPage extends PageEvent {
  final Ticket ticket;

  GoToselectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToCheckoutPage extends PageEvent {
  final Ticket ticket;

  GoToCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSuccessPage extends PageEvent {
  final Ticket ticket;
  final FlutixTransaction transaction;

  GoToSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class GoToTicketPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTicketDetailPage extends PageEvent {
  final Ticket tickets;

  GoToTicketDetailPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoToTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];
}

class GoToMyWalletPage extends PageEvent {
  final PageEvent pageEvent;

  GoToMyWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToEditProfilePage extends PageEvent {
  final User user;

  GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}