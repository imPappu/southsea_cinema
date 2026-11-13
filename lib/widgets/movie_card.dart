import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                movie.posterImagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              movie.title,
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 8.0),
            Text(
              movie.synopsis,
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12.0),
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
                    movie.ageRating,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(
                  movie.screeningTime,
                  style: const TextStyle(
                    color: cinemaFontMuted,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  movie.formattedPrice,
                  style: const TextStyle(
                    color: cinemaBrand,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieListing(movie: movie),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('Book Tickets'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
