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

    test('fromJson creates Movie from JSON map', () {
      final json = {
        'id': 'phantom',
        'title': 'The Phantom of the Opera',
        'synopsis': 'A masked musical genius haunts the Paris Opera House.',
        'ageRating': 'PG-13',
        'screeningTime': '19:30',
        'ticketPrice': 12.50,
        'posterImagePath': 'assets/images/phantom.png',
      };

      final movie = Movie.fromJson(json);

      expect(movie.id, 'phantom');
      expect(movie.title, 'The Phantom of the Opera');
      expect(movie.synopsis, 'A masked musical genius haunts the Paris Opera House.');
      expect(movie.ageRating, 'PG-13');
      expect(movie.screeningTime, '19:30');
      expect(movie.ticketPrice, 12.50);
      expect(movie.posterImagePath, 'assets/images/phantom.png');
      expect(movie.formattedPrice, '£12.50');
    });

    test('toJson produces correct Map', () {
      final movie = Movie(
        id: 'test-id',
        title: 'Test Movie',
        synopsis: 'A test synopsis',
        ageRating: 'PG',
        screeningTime: '20:00',
        ticketPrice: 10.00,
        posterImagePath: 'assets/images/test.png',
      );

      final json = movie.toJson();

      expect(json['id'], 'test-id');
      expect(json['title'], 'Test Movie');
      expect(json['synopsis'], 'A test synopsis');
      expect(json['ageRating'], 'PG');
      expect(json['screeningTime'], '20:00');
      expect(json['ticketPrice'], 10.00);
      expect(json['posterImagePath'], 'assets/images/test.png');
    });

    test('fromJson handles whole-number prices correctly', () {
      final json = {
        'id': 'whole-price',
        'title': 'Whole Price Movie',
        'synopsis': 'Test',
        'ageRating': 'U',
        'screeningTime': '20:00',
        'ticketPrice': 10,
        'posterImagePath': 'assets/images/test.png',
      };

      final movie = Movie.fromJson(json);

      expect(movie.ticketPrice, 10.0);
      expect(movie.formattedPrice, '£10.00');
    });

    test('toJson handles whole-number ticketPrice', () {
      final movie = Movie(
        id: 'whole-price-2',
        title: 'Whole Price Movie 2',
        synopsis: 'Test',
        ageRating: 'U',
        screeningTime: '20:00',
        ticketPrice: 10.00,
        posterImagePath: 'assets/images/test.png',
      );

      final json = movie.toJson();

      expect(json['ticketPrice'], 10.0);
    });
  });
}
