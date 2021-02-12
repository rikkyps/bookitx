part of 'widgets.dart';

class CastCrew extends StatelessWidget {
  final Credit credit;
  final Function onTap;

  CastCrew(this.credit, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 51,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image:
                        NetworkImage(imageBaseURL + 'w500' + credit.profilePath),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: SizedBox(
              width: 52,
              child: Text(
                credit.name,
                style: blackTextFont.copyWith(fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
