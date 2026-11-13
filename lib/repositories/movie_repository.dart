import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'A masked musical genius haunts the Paris Opera House, '
            'obsessed with a beautiful soprano. Andrew Lloyd Webber\'s '
            'legendary musical comes to life on screen.',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/phantom.png',
      ),
      Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'A team of explorers travel through a wormhole in space '
            'in an attempt to ensure humanity\'s survival. Christopher '
            'Nolan\'s epic sci-fi adventure.',
        ageRating: '12A',
        screeningTime: '20:00',
        ticketPrice: 14.00,
        posterImagePath: 'assets/images/interstellar.png',
      ),
      Movie(
        id: 'dune',
        title: 'Dune: Part Two',
        synopsis: 'Paul Atreides unites with the Fremen to wage war against '
            'House Harkonnen on the desert planet Arrakis. Denis Villeneuve\'s '
            'stunning continuation of Frank Herbert\'s saga.',
        ageRating: '12A',
        screeningTime: '18:45',
        ticketPrice: 13.50,
        posterImagePath: 'assets/images/dune.png',
      ),
    ];
  }
}