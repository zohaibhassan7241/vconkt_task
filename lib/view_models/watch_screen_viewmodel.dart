import 'package:vconekt_task/constants/paths.dart';



class WatchScreenViewModel extends ChangeNotifier {
  bool _loading = false;
  View _view = View.inTheatre;
  View get view => _view;
  bool get loading => _loading;
  List<MoviesModel> _inTheatreMovies = [];
  List<MoviesModel> get inTheatreMovies => _inTheatreMovies;
  //Loading
  void toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }
//Fetch Movies
  void fetchMovies() async {
    toggleLoading();
    try {
      var response = await DioClient.instance.get(APIConstants.inTheatreMovies);

      if (response.data['errorMessage'].toString().isEmpty) {
        _inTheatreMovies.clear();
        response.data['items'].forEach((e) {
          _inTheatreMovies.add(MoviesModel.fromJson(e));
        });
        notifyListeners();
      }
      toggleLoading();
    } catch (e) {
      toggleLoading();
    }
  }
}
