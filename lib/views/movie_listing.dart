import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          children: [
            Image.network(
              'https://southseacinema.co.uk/wp-content/uploads/2024/06/2024-06-14-19.00.jpg',
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Text('Your film title'),
            const Text('Your film description'),
            ElevatedButton(
              onPressed: () {
                print('Add to order button pressed');
              },
              child: const Text('Add to order'),
            ),
          ],
        ),
      ),
    );
  }
}
