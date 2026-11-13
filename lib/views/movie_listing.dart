import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.movie.posterImagePath,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.movie.title,
                    style: cinemaHeaderStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: cinemaBrand,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          widget.movie.ageRating,
                          style: const TextStyle(
                            color: cinemaFontWhite,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        widget.movie.screeningTime,
                        style: const TextStyle(
                          color: cinemaFontMuted,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.movie.formattedPrice,
                        style: const TextStyle(
                          color: cinemaBrand,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.movie.synopsis,
                    style: const TextStyle(
                      color: cinemaFontWhite,
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
                          developer.log('Selected ticket count: $_ticketCount',
                              name: 'MovieListing');
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
                        _bookingMessage =
                            'Added $_ticketCount tickets to the order for ${widget.movie.title}';
                      });
                      developer.log(_bookingMessage, name: 'MovieListing');
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
            ),
          );
        },
      ),
    );
  }
}
