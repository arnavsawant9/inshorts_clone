// class NewsModel {
//   final String title;
//   final String desc;
//   final String image;
//   final String content;
//   final String description;
//   final String source;
//   final DateTime publishedAt;
//   NewsModel(
//       {this.title = '',
//       this.content = '',
//       this.desc = '',
//       this.image = '',
//       this.source = '',
//       DateTime? publishedAt})
//       : this.publishedAt = publishedAt ?? DateTime.now();

//   factory NewsModel.fromJson(json) {
//     return NewsModel(
//       title: json['title'] ?? 'No Title',
//       source: json['source']['name'] ?? 'Unknown',
//       image: json['urlToImage'] ?? '',
//       publishedAt: DateTime.parse(json['publishedAt']),
//       description: json['description'], // Ensure this exists
//       url: json['url'], // Ensure this exists
//     );
//   }
// }





class NewsModel {
  final String title;
  final String source;
  final String image;
  final DateTime publishedAt;
  final String? description; // Nullable field
  final String? url; // Nullable field

  NewsModel({
    required this.title,
    required this.source,
    required this.image,
    required this.publishedAt,
    this.description, // Make it optional
    this.url, // Make it optional
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      source: json['source']['name'] ?? 'Unknown',
      image: json['urlToImage'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
      description: json['description'] ?? 'No description available', // Default value
      url: json['url'] ?? '', // Default empty string
    );
  }
}
