part of 'widgets.dart';

class MoneyCard extends StatelessWidget {
  final double width;
  final bool isSelected;
  final int amount;
  final Function onTap;

  MoneyCard(
      {this.width = 90, this.isSelected = false, this.amount = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? Colors.transparent : Color(0xFFE4E4E4)),
            color: isSelected ? accentColor2 : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IDR',
              style: greyTextFont.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              NumberFormat.currency(
                locale: 'id_ID',
                decimalDigits: 0,
                symbol: '',
              ).format(amount),
              style: blackNumberFormat.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
