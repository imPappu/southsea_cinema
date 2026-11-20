import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Basket'),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
      ),
      body: const Center(
        child: Text(
          'Basket Page',
          style: cinemaHeaderStyle,
        ),
      ),
    );
  }
}