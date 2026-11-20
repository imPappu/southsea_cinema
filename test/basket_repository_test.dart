import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

void main() {
  group('BasketRepository unit tests', () {
    test('basket starts empty', () {
      final BasketRepository repository = BasketRepository();

      expect(repository.items, isEmpty);
      expect(repository.total, 0.0);
      expect(repository.totalItems, 0);
    });

    test('add adds a ticket to the basket', () {
      final BasketRepository repository = BasketRepository();
      final Movie movie = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(movie, quantity: 1);

      expect(repository.items.length, 1);
      expect(repository.items[0].quantity, 1);
      expect(repository.total, 12.50);
      expect(repository.totalItems, 1);
    });

    test('add increments quantity for existing movie', () {
      final BasketRepository repository = BasketRepository();
      final Movie movie = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(movie, quantity: 1);
      repository.add(movie, quantity: 1);

      expect(repository.items.length, 1);
      expect(repository.items[0].quantity, 2);
      expect(repository.total, 25.00);
      expect(repository.totalItems, 2);
    });

    test('remove decrements quantity', () {
      final BasketRepository repository = BasketRepository();
      final Movie movie = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(movie, quantity: 1);
      repository.add(movie, quantity: 1);
      repository.remove(movie);

      expect(repository.items.length, 1);
      expect(repository.items[0].quantity, 1);
      expect(repository.total, 12.50);
      expect(repository.totalItems, 1);
    });

    test('remove removes item when quantity reaches zero', () {
      final BasketRepository repository = BasketRepository();
      final Movie movie = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(movie, quantity: 1);
      repository.add(movie, quantity: 1);
      repository.remove(movie);
      repository.remove(movie);

      expect(repository.items, isEmpty);
      expect(repository.total, 0.0);
      expect(repository.totalItems, 0);
    });

    test('clear empties the basket', () {
      final BasketRepository repository = BasketRepository();
      final Movie movie = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(movie, quantity: 1);
      repository.add(movie, quantity: 1);
      repository.clear();

      expect(repository.items, isEmpty);
      expect(repository.total, 0.0);
      expect(repository.totalItems, 0);
    });

    test('get total price for multiple different movies', () {
      final BasketRepository repository = BasketRepository();

      final Movie phantom = Movie(
        id: 'phantom',
        title: 'The Phantom of the Opera',
        synopsis: 'Test synopsis',
        ageRating: 'PG-13',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/test.png',
      );

      final Movie interstellar = Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'Test synopsis',
        ageRating: '12A',
        screeningTime: '20:00',
        ticketPrice: 14.00,
        posterImagePath: 'assets/images/test.png',
      );

      repository.add(phantom, quantity: 1);
      repository.add(interstellar, quantity: 1);
      repository.add(phantom, quantity: 1);

      expect(repository.total, 39.00);
      expect(repository.totalItems, 3);
    });
  });
}