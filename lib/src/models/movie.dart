

class Movie {
  final String name;
  final String id;
  final String description;

  const Movie({
    required this.name,
    required this.id,
    required this.description
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['snippet']['title'],
      description: json['snippet']['description']
    );
  }
}
