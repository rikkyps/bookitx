part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genres;

  BrowseButton(this.genres);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0xFFEBEFF6),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(getImageFromGenre(genres)), fit: BoxFit.cover)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(genres, style: blackTextFont.copyWith(fontSize: 13)))
        ],
      ),
    );
  }

  String getImageFromGenre(String genre) {
    switch (genre) {
      case 'Horror':
        return ('assets/ic_horror.png');
        break;
      case 'Drama':
        return ('assets/ic_drama.png');
        break;
      case 'Comedy':
        return ('assets/ic_comedy.png');
        break;
      case 'Champion':
        return ('assets/ic_champion.png');
        break;
      case 'Music':
        return ('assets/ic_music.png');
        break;
      case 'Action':
        return ('assets/ic_action.png');
        break;
      default:
        return '';
    }
  }
}
