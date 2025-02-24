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
      searchResults = fetchedNews.take(4).toList(); // Max 4 results
    });
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search for news...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => searchNews(searchController.text),
                ),
              ),
              onSubmitted: searchNews,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text("Search for articles"))
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
  const NewsCard({super.key, this.title, this.source, this.date, this.image, this.description, this.url});

  void _launchURL() async {
    if (url != null && await canLaunch(url!)) {
      await launch(url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: image != null && image!.isNotEmpty
            ? Image.network(image!, width: 80, height: 80, fit: BoxFit.cover)
            : const SizedBox(width: 80, height: 80),
        title: Text(title ?? "No Title", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$source • $date'),
        trailing: IconButton(
          icon: Icon(Icons.open_in_new),
          onPressed: _launchURL,
        ),
      ),
    );
  }
}
