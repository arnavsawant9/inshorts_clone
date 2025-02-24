import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/news_api.dart';
import '../model/news_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<NewsModel> searchResults = [];
  NewsApi newsApi = NewsApi();
  TextEditingController searchController = TextEditingController();

  Future<void> searchNews(String query) async {
    if (query.isEmpty) return;
    List<NewsModel> fetchedNews = await newsApi.searchNews(query);
    setState(() {
      searchResults = fetchedNews.take(8).toList(); // Max 8 results
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Light blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search for news...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
              onSubmitted: searchNews,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(
                      child: Text(
                        "Search for articles",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          title: searchResults[index].title,
                          source: searchResults[index].source,
                          image: searchResults[index].image,
                          date: formatDate(searchResults[index].publishedAt),
                          description: searchResults[index].description,
                          url: searchResults[index].url,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String? title, source, date, image, description, url;
  const NewsCard({
    Key? key,
    this.title,
    this.source,
    this.date,
    this.image,
    this.description,
    this.url,
  }) : super(key: key);

  void _launchURL() async {
    if (url != null && await canLaunch(url!)) {
      await launch(url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: image != null && image!.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image, color: Colors.grey[700]),
                    );
                  },
                ),
              )
            : Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: Icon(Icons.image, color: Colors.grey[700]),
              ),
        title: Text(
          title ?? "No Title",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '$source • $date',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.open_in_new, color: Colors.blueAccent),
          onPressed: _launchURL,
        ),
      ),
    );
  }
}
