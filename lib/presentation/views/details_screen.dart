import 'package:vconekt_task/constants/paths.dart';


class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.movieDetails}) : super(key: key);
  final MoviesModel movieDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ///Image
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.bottomNavBarBgColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: CachedNetworkImageProvider(
                        movieDetails.image!,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.whiteColor,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text('Movies Details',
                            style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(
                              fontSize: 15,
                              color: AppColors.whiteColor
                            )),
                      ),
                    ],
                  ),
                ),
                ///Release Date
                Positioned.fill(
                  top: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('In Theaters December 22, 2021',
                        style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(
                          fontSize: 15,
                          color:AppColors.appBarBgColor
                        )),
                  ),
                ),
                ///Genres
                Positioned(
                  bottom: 90,
                  child: Text(
                    'Genres',
                    style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(color: AppColors.whiteColor),
                  ),
                ),
                ///Genres List
                Positioned(
                  bottom: 30,
                  child: SizedBox(
                    height: 28,
                    child: ListView.builder(
                      itemCount: movieDetails.genreList?.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 40.0),
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: getRandomGenreColor(),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            movieDetails.genreList![index].value ?? '',
                            style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ///OverView
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40.0, bottom: 10),
            child: Text(
              'Overview',
              style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(color: Colors.black),
            ),
          ),
          ///Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 30),
              child: Text(
                movieDetails.plot ?? '',
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
///Random Color for Genres
  Color getRandomGenreColor() {
    Random random = Random();
    int num = random.nextInt(3);
    if (num == 0) {
      return AppColors.genre1;
    } else if (num == 1) {
      return AppColors.genre2;
    } else if (num == 2) {
      return AppColors.genre3;
    } else {
      return AppColors.defaultGenreColor;
    }
  }
}

