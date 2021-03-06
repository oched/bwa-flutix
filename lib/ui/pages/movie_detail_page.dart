part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<ProfileCredit> credits;

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: MovieServices.getMovieDetail(movie),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              movieDetail = snapshot.data;

              return FutureBuilder(
                future: MovieServices.getCredits(movie.id),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    credits = snapshot.data;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(movieDetail.title),
                        Text(movieDetail.genresAndLanguage),
                        Column(
                          children: credits.map((e) => Text(e.name)).toList(),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
