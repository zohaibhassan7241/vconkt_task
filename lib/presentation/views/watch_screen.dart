import 'package:vconekt_task/constants/paths.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  TextEditingController searchController = TextEditingController();
  late WatchScreenViewModel moviesProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Provider
    moviesProvider = Provider.of<WatchScreenViewModel>(
      context,
      listen: false,
    );
    //Fetch Movies
    Future.delayed(
      Duration.zero,
      () {
        moviesProvider.fetchMovies();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          60,
        ),
        child: Selector<WatchScreenViewModel, View>(selector: (context, watchScreenViewModel) {
          return watchScreenViewModel.view;
        }, builder: (context, view, _) {
          ///AppBar Title
          return AppBar(
            title:  Text('Movies List',style: AppTextStyle.kAppBarColor,),
            elevation: 0,
          );
        }),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        ///List of Movies
        child: ListingView(),
      ),
      // bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
