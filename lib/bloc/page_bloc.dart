import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(bottomNavbarIndex: event.bottomNavbarIndex, isExpired: event.isExpired);
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmPage) {
      yield OnAccountConfirmPage(event.registrationData);
    } else if (event is GoToMovieDetailPage) {
      yield OnMovieDetailPage(event.movie);
    } else if (event is GoToSelectSchedulePage) {
      yield OnSelectSchedulePage(event.movieDetail);
    } else if (event is GoToselectSeatPage) {
      yield OnSelectSeatPage(event.ticket);
    } else if (event is GoToCheckoutPage) {
      yield OnCheckoutPage(event.ticket);
    } else if (event is GoToSuccessPage) {
      yield OnSuccessPage(event.ticket, event.transaction);
    } else if (event is GoToTicketPage) {
      yield OnTicketPage();
    } else if (event is GoToTicketDetailPage) {
      yield OnTicketDetailPage(event.tickets);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoToTopUpPage) {
      yield OnTopUpPage(event.pageEvent);
    } else if (event is GoToMyWalletPage) {
      yield OnMyWalletPage(event.pageEvent);
    } else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage(event.user);
    }
  }
}
