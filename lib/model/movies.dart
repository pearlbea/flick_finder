import 'movie.dart';

class Movies {
  static List<Movie> loadMovies() {
    const allMovies = <Movie>[
      Movie(
        id: 338952,
        title: 'Fantastic Beasts: The Crimes of Grindelwald',
      ),
      Movie(
        id: 353081,
        title: 'Mission: Impossible - Fallout',
      ),
      Movie(
        id: 507569,
        title: 'The Seven Deadly Sins: Prisoners of the Sky',
      )
    ];

    return allMovies;
  }
}
