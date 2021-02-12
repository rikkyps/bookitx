part of 'widgets.dart';

class CoomingSoonCard extends StatelessWidget {
  final Movie movies;
  final Function onTap;

  CoomingSoonCard(this.movies, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imageBaseURL + 'w500' + movies.backdropPath),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Text(
                  movies.title,
                  style: whiteTextFont.copyWith(fontSize: 12),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
