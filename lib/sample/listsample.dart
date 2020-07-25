//class MovieListViewDetails extends StatelessWidget {
//  final String movieName;
//
//  const MovieListViewDetails({Key key, this.movieName}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Movies"),
//        backgroundColor: Colors.blueGrey.shade900,
//      ),
//      body: Container(
//        child: RaisedButton(
//          child: Text("Go back ${this.movieName}"),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
//      ),
//    );
//  }
//}