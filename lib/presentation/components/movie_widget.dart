import 'package:vconekt_task/constants/paths.dart';

class MovieWidget extends StatefulWidget {
  final String? imagePath;
  final String? movieName;
  final String movieDes;
  const MovieWidget({Key? key, this.imagePath, this.movieName, required this.movieDes})
      : super(key: key);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Card(
        elevation: 2,
        color: Theme.of(context).canvasColor,
        child: Column(
          children: <Widget>[
            ///Title
            InkWell(
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  widget.movieName ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ///Image and description widget
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _expanded
                  ? widget.movieDes.length > 120 && widget.movieDes.length < 150
                      ? 120
                      : widget.movieDes.length > 150 && widget.movieDes.length < 180
                          ? 150
                          : widget.movieDes.length > 180
                              ? 180
                              : 100
                  : 0,
              width: MediaQuery.of(context).size.width,
              child: ItemExpandedTile(
                imagePath: widget.imagePath,
                movieDes: widget.movieDes,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemExpandedTile extends StatelessWidget {
  final String? imagePath;
  final String? movieDes;
  const ItemExpandedTile({Key? key, this.imagePath, this.movieDes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: Row(
          children: [
            ///Movie Image
            CachedNetworkImage(
              imageUrl: imagePath!,
              imageBuilder: (context, imageProvider) => Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            ///Movie Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: Text(
                  movieDes ?? '',
                  style: AppTextStyle.kTwelveWithGreyColor400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
