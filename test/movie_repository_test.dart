import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns three movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 3);
    });

    test('getMovies contains valid movies with correct attributes', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie phantom = movies[0];
      expect(phantom.id, 'phantom');
      expect(phantom.title, 'The Phantom of the Opera');
      expect(phantom.ageRating, 'PG-13');
      expect(phantom.screeningTime, '19:30');
      expect(phantom.ticketPrice, 12.50);
      expect(phantom.posterImagePath, isNotEmpty);

      final Movie interstellar = movies[1];
      expect(interstellar.id, 'interstellar');
      expect(interstellar.title, 'Interstellar');
      expect(interstellar.ageRating, '12A');
      expect(interstellar.screeningTime, '20:00');
      expect(interstellar.ticketPrice, 14.00);
      expect(interstellar.posterImagePath, isNotEmpty);

      final Movie dune = movies[2];
      expect(dune.id, 'dune');
      expect(dune.title, 'Dune: Part Two');
      expect(dune.ageRating, '12A');
      expect(dune.screeningTime, '18:45');
      expect(dune.ticketPrice, 13.50);
      expect(dune.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('phantom');

      expect(movie, isNotNull);
      expect(movie?.title, 'The Phantom of the Opera');
      expect(movie?.ageRating, 'PG-13');
      expect(movie?.ticketPrice, 12.50);
      expect(movie?.formattedPrice, '£12.50');
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
