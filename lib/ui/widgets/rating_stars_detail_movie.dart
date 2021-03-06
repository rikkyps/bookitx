part of 'widgets.dart';

class RatingStarDetailMovie extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;

  RatingStarDetailMovie({this.voteAverage = 0, this.starSize = 20, this.fontSize = 13});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starSize,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      '$voteAverage/10',
      style: blackNumberFormat.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
      ),
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}
