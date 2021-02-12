part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> listCredit;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
            future: MovieServices.getDetail(movie),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                movieDetail = snapshot.data;
                return FutureBuilder(
                  future: MovieServices.getCredit(movie.id),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      listCredit = snapshot.data;
                      return Stack(children: [
                        Container(
                          color: mainColor,
                        ),
                        SafeArea(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        ListView(children: [
                          //HEADER
                          Stack(children: [
                            Container(
                              height: 275,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseURL +
                                          'w780' +
                                          movieDetail.backdropPath),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                height: 275,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.white,
                                      Colors.transparent
                                    ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter))),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 20, left: defaultMargin),
                              height: 56,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .bloc<PageBloc>()
                                          .add(GoToMainPage());
                                    },
                                    child: Icon(Icons.arrow_back,
                                        color: Colors.white),
                                  )),
                            )
                          ]),
                          //TEXT MOVIE
                          Container(
                            margin: EdgeInsets.only(top: 12, bottom: 12),
                            child: Column(
                              children: [
                                Text(
                                  movieDetail.title,
                                  style: blackTextFont.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  movieDetail.genreAndLanguage,
                                  style: greyTextFont.copyWith(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RatingStarDetailMovie(
                                  voteAverage: movieDetail.voteAverage,
                                ),
                              ],
                            ),
                          ),
                          //CAST MOVIE
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: defaultMargin),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Cast & Crew',
                                      style: blackTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 90,
                                    margin: EdgeInsets.only(top: 6),
                                    child: ListView.builder(
                                      itemCount: listCredit.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => Container(
                                        margin: EdgeInsets.only(
                                            left: (index == 0)
                                                ? defaultMargin
                                                : 0,
                                            right:
                                                (index == listCredit.length - 1)
                                                    ? defaultMargin
                                                    : 16),
                                        child: CastCrew(listCredit[index]),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          //OVERVIEW
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Storyline',
                                    style: blackTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  child: Text(
                                    movieDetail.overview,
                                    style: greyTextFont.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // BUTTON CTA
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin, 30, defaultMargin, 20),
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: RaisedButton(
                              child: Text('Continue To Book',
                                  style: whiteTextFont.copyWith(fontSize: 16)),
                              color: mainColor,
                              onPressed: () {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToSelectSchedulePage(movieDetail));
                              },
                            ),
                          )
                        ]),
                      ]);
                    } else {
                      return SizedBox(
                        child: SpinKitFadingCircle(color: mainColor, size: 50),
                      );
                    }
                  },
                );
              } else {
                return SizedBox(
                  child: SpinKitFadingCircle(color: mainColor, size: 50),
                );
              }
            }),
      ),
    );
  }
}
