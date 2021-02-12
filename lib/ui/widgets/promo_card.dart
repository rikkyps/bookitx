part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo.title, style: whiteTextFont),
                    Text(
                      promo.subTitle,
                      style: whiteTextFont.copyWith(
                          fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ]),
              Row(
                children: [
                  Text(
                    'OFF ',
                    style: yellowNumberFormat.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text('${promo.disc}%',
                      style: yellowNumberFormat.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (rectagle) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.white.withOpacity(0.2), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 77.9, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 77.9,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset('assets/gradient1.png')),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectagle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 105, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 105,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset('assets/gradient2.png')),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectagle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 60, 25));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset('assets/gradient2.png')),
            ),
          ),
        )
      ],
    );
  }
}
