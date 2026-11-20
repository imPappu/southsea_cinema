class Movie {
  final String id;
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double ticketPrice;
  final String posterImagePath;

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.ticketPrice,
    required this.posterImagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json['id'] as String,
    title: json['title'] as String,
    synopsis: json['synopsis'] as String,
    ageRating: json['ageRating'] as String,
    screeningTime: json['screeningTime'] as String,
    ticketPrice: (json['ticketPrice'] as num).toDouble(),
    posterImagePath: json['posterImagePath'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'synopsis': synopsis,
    'ageRating': ageRating,
    'screeningTime': screeningTime,
    'ticketPrice': ticketPrice,
    'posterImagePath': posterImagePath,
  };

  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';
}
