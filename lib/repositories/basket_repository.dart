import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';

class BasketRepository {
  List<BasketItem> _items = [];

  void add(Movie movie) {
    final existingIndex =
        _items.indexWhere((item) => item.movie.id == movie.id);

    if (existingIndex >= 0) {
      _items[existingIndex] = BasketItem(
        movie: _items[existingIndex].movie,
        quantity: _items[existingIndex].quantity + 1,
      );
    } else {
      _items.add(BasketItem(movie: movie));
    }
  }

  void remove(Movie movie) {
    final existingIndex =
        _items.indexWhere((item) => item.movie.id == movie.id);

    if (existingIndex >= 0) {
      if (_items[existingIndex].quantity > 1) {
        _items = List<BasketItem>.from(_items..[existingIndex] = BasketItem(
          movie: _items[existingIndex].movie,
          quantity: _items[existingIndex].quantity - 1,
        ));
      } else {
        _items.removeAt(existingIndex);
      }
    }
  }

  void clear() {
    _items.clear();
  }

  List<BasketItem> get items => List.unmodifiable(_items);

  double get total {
    double sum = 0.0;
    for (final item in _items) {
      sum += item.movie.ticketPrice * item.quantity;
    }
    return sum;
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);
}