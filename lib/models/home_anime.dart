class HomeAnime {
  int malId;
  String title;
  String imageUrl;

  HomeAnime({
    required this.malId,
    required this.title,
    required this.imageUrl,
  });

  factory HomeAnime.fromJson(Map<String, dynamic> data) {
    return HomeAnime(
      malId: data['mal_id'] ?? '',
      title: data["title"] ?? '',
      imageUrl: data['images']['jpg']['image_url'] ?? '',
    );
  }
}
