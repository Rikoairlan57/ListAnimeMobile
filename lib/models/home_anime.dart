class HomeAnime {
  int malId;
  String title;
  String imageUrl;
  // bool score;

  HomeAnime({
    required this.imageUrl,
    required this.malId,
    required this.title,
    // required this.score,
  });

  factory HomeAnime.fromJson(Map<String, dynamic> data) {
    return HomeAnime(
      imageUrl: data['images']['jpg']['image_url'] ?? '',
      malId: data['mal_id'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
