import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketCount = 1;
  String _bookingMessage = '';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Container(
            padding: EdgeInsets.all(isWide ? 32.0 : 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Image.network(
                  'https://image.tmdb.org/t/p/original/yUb2UO6Aam9rJBmWBb7MErAz2gL.jpg',
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your film title',
                  style: cinemaHeaderStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Your film description',
                  style: TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                DropdownMenu<int>(
                  initialSelection: _ticketCount,
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        _ticketCount = value;
                        print('Selected ticket count: $_ticketCount');
                      });
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: '1 ticket'),
                    DropdownMenuEntry(value: 2, label: '2 tickets'),
                    DropdownMenuEntry(value: 3, label: '3 tickets'),
                    DropdownMenuEntry(value: 4, label: '4 tickets'),
                    DropdownMenuEntry(value: 5, label: '5 tickets'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Tickets selected: $_ticketCount',
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bookingMessage = 'Added $_ticketCount tickets to the order';
                    });
                    print(_bookingMessage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: cinemaFontWhite,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Add to order'),
                ),
                const SizedBox(height: 8),
                Text(
                  _bookingMessage,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}