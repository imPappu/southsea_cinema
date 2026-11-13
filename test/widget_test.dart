import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
    });

    testWidgets('Displays movie cards with titles and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      expect(find.text('The Phantom of the Opera'), findsOneWidget);
      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('Book Tickets'), findsNWidgets(2));
    });

    testWidgets('Scrolling shows third movie card',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      
      await tester.drag(find.byType(ListView), const Offset(0, -500));
      await tester.pumpAndSettle();
      
      expect(find.text('Dune: Part Two'), findsOneWidget);
      expect(find.text('£13.50'), findsOneWidget);
    });

    testWidgets('Tapping Book Tickets navigates to MovieListing with selected movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book Tickets').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('The Phantom of the Opera'), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    });
  });

  group('MovieListing booking flow', () {
    testWidgets('MovieListing displays movie details and price',
        (WidgetTester tester) async {
      const movie = Movie(
        id: 'test',
        title: 'Test Movie',
        synopsis: 'Test description',
        ageRating: '12A',
        screeningTime: '19:30',
        ticketPrice: 10.00,
        posterImagePath: 'assets/images/phantom.png',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListing(movie: movie),
        ),
      );

      expect(find.text('Test Movie'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    });

    testWidgets('MovieListing shows booking feedback when Add to order tapped',
        (WidgetTester tester) async {
      const movie = Movie(
        id: 'test',
        title: 'Test Movie',
        synopsis: 'Test description',
        ageRating: '12A',
        screeningTime: '19:30',
        ticketPrice: 10.00,
        posterImagePath: 'assets/images/phantom.png',
      );

      // Set a larger test viewport
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        MaterialApp(
          home: MovieListing(movie: movie),
        ),
      );

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('Added 1 tickets to the order for Test Movie'), findsOneWidget);

      // Reset viewport
      tester.view.resetPhysicalSize();
    });
  });
}