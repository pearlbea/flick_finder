import 'movie.dart';

class Movies {
  static const String basePath = 'https://image.tmdb.org/t/p/';
  static const String size = 'w154';

  static List<Movie> loadMovies() {
    const List<Movie> allMovies = <Movie>[
      Movie(
        id: 338952,
        title: 'Fantastic Beasts: The Crimes of Grindelwald',
        poster: '$basePath$size/uyJgTzAsp3Za2TaPiZt2yaKYRIR.jpg',
      ),
      Movie(
        id: 353081,
        title: 'Mission: Impossible - Fallout',
        poster: '$basePath$size/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg',
      ),
      Movie(
        id: 507569,
        title: 'The Seven Deadly Sins: Prisoners of the Sky',
        poster: '$basePath$size/r6pPUVUKU5eIpYj4oEzidk5ZibB.jpg',
      )
    ];

    return allMovies;
  }
}
