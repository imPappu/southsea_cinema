import 'package:test/test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie', () {
    test('constructor assigns all properties correctly', () {
      const movie = Movie(
        id: 'test-1',
        title: 'Test Movie',
        synopsis: 'A test synopsis',
        ageRating: '12A',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      expect(movie.id, 'test-1');
      expect(movie.title, 'Test Movie');
      expect(movie.synopsis, 'A test synopsis');
      expect(movie.ageRating, '12A');
      expect(movie.screeningTime, '19:30');
      expect(movie.ticketPrice, 12.50);
      expect(movie.posterImagePath, 'assets/images/test.png');
    });

    test('formattedPrice returns two decimal places for whole-pound price', () {
      const movie = Movie(
        id: 'test-2',
        title: 'Whole Pound Movie',
        synopsis: 'Test',
        ageRating: 'PG',
        screeningTime: '20:00',
        ticketPrice: 10.0,
        posterImagePath: 'assets/images/test.png',
      );

      expect(movie.formattedPrice, '£10.00');
    });

    test('formattedPrice returns two decimal places for price with pence', () {
      const movie = Movie(
        id: 'test-3',
        title: 'Pence Movie',
        synopsis: 'Test',
        ageRating: '15',
        screeningTime: '21:00',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      expect(movie.formattedPrice, '£12.50');
    });

    test('formattedPrice handles prices like 8.5 correctly', () {
      const movie = Movie(
        id: 'test-4',
        title: 'Single Decimal Movie',
        synopsis: 'Test',
        ageRating: 'U',
        screeningTime: '18:00',
        ticketPrice: 8.5,
        posterImagePath: 'assets/images/test.png',
      );

      expect(movie.formattedPrice, '£8.50');
    });
  });
}
