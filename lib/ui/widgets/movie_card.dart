part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final Movie movies;
  final Function onTap;

  MovieCard(this.movies, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          width: 210,
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image:
                      NetworkImage(imageBaseURL + 'w780' + movies.backdropPath),
                  fit: BoxFit.cover)),
          child: Container(
            width: 210,
            height: 240,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movies.title,
                  style: whiteTextFont.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                RatingStars(voteAverage: movies.voteAverage)
              ],
            ),
          )),
    );
  }
}
