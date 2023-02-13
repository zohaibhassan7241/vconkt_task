import 'package:vconekt_task/constants/paths.dart';

class ListingView extends StatelessWidget {
  const ListingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchScreenViewModel>(
      builder: (_, watchScreenViewModel, __) {
        return watchScreenViewModel.loading
        ///Progress Indicator while loading
            ? const Center(child: CircularProgressIndicator())
        ///SHow Result After Api
            : Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ///List of Movies
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            ///Navigate to details Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => MovieDetailsScreen(
                                  movieDetails: watchScreenViewModel.inTheatreMovies[index],
                                ),
                              ),
                            );
                          },
                          ///Movies Widget
                          child: MovieWidget(
                            imagePath: watchScreenViewModel.inTheatreMovies[index].image ?? '',
                            movieName: watchScreenViewModel.inTheatreMovies[index].title ?? '',
                            movieDes: watchScreenViewModel.inTheatreMovies[index].plot ?? '',
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: watchScreenViewModel.inTheatreMovies.length,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
