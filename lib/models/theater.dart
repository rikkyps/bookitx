part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater('XXI CSB Mall Cirebon'),
  Theater('CGV Grage City Cirebon'),
  Theater('21 Grage Mall Cirebon'),
  Theater('XXI Cirebon Mall')
];