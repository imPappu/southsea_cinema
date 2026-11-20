import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = BasketRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Basket'),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
      ),
      body: BasketContent(repository: repository),
    );
  }
}

class BasketContent extends StatelessWidget {
  final BasketRepository repository;

  const BasketContent({
    required this.repository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildBasketList(),
        ),
        _buildTotalRow(),
      ],
    );
  }

  Widget _buildBasketList() {
    if (repository.items.isEmpty) {
      return Center(
        child: Text(
          'Your basket is empty',
          style: TextStyle(
            color: cinemaFontMuted,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: repository.items.length,
      itemBuilder: (context, index) {
        final item = repository.items[index];
        return _BasketItemTile(
          movie: item.movie,
          quantity: item.quantity,
          onIncrement: () => repository.add(item.movie),
          onDecrement: () => repository.remove(item.movie),
        );
      },
    );
  }

  Widget _buildTotalRow() {
    return Container(
      color: cinemaBackground,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: ${repository.total.toStringAsFixed(2)}',
            style: const TextStyle(
              color: cinemaFontWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${repository.totalItems} tickets',
            style: TextStyle(
              color: cinemaFontMuted,
              fontSize: 14,
            ),
          ),
          ElevatedButton(
            onPressed: repository.items.isEmpty ? null : repository.clear,
            style: ElevatedButton.styleFrom(
              backgroundColor: cinemaBrand,
              foregroundColor: cinemaFontWhite,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}

class _BasketItemTile extends StatelessWidget {
  final Movie movie;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  _BasketItemTile({
    required this.movie,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            movie.posterImagePath,
            width: 60,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          movie.title,
          style: const TextStyle(
            color: cinemaFontWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '£${movie.formattedPrice} per ticket',
          style: TextStyle(
            color: cinemaFontMuted,
            fontSize: 12,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          IconButton(
            icon: const Icon(Icons.remove, color: cinemaFontMuted),
            onPressed: quantity > 1 ? onDecrement : null,
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              color: cinemaFontWhite,
              fontSize: 14,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: cinemaBrand),
            onPressed: onIncrement,
          ),
        ],
        ),
      ),
    );
  }
}