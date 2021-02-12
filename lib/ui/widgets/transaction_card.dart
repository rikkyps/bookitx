part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final double width;
  final FlutixTransaction flutixTransaction;

  TransactionCard(this.flutixTransaction, this.width);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 90,
          margin: EdgeInsets.only(
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: (flutixTransaction.picture != null)
                    ? NetworkImage(
                        imageBaseURL + 'w500' + flutixTransaction.picture)
                    : AssetImage('assets/success_topup.png'),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: width - 86,
              child: Text(
                flutixTransaction.title,
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              width: width - 86,
              child: Text(
                NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0).format(
                    flutixTransaction.amount < 0
                        ? -flutixTransaction.amount
                        : flutixTransaction.amount),
                style: whiteNumberFormat.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: flutixTransaction.amount < 0
                        ? Color(0xFFFF5C83)
                        : Color(0xFF3E9D9D)),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              width: width - 86,
              child: Text(
                flutixTransaction.subTitle,
                style: greyTextFont.copyWith(fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }
}
