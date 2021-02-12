part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subTitle;
  final int disc;

  Promo({@required this.title, @required this.subTitle, @required this.disc});

  @override
  List<Object> get props => [title, subTitle, disc];
}

List<Promo> dummyPromos = [
  Promo(
      title: 'Student Holiday',
      subTitle: 'Maximal only for two people',
      disc: 50),
  Promo(
      title: 'Family Club',
      subTitle: 'Maximal only for three members',
      disc: 70),
  Promo(title: 'Subscription', subTitle: 'Min. one year', disc: 40),
];
