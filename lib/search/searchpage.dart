// import 'package:flutter/material.dart';

// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Page'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // this is for handling the notifications here!!
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // My Feed Section
//             _buildSectionHeader('My Feed'),
//             _buildHorizontalScroll([
//               'Roundups',
//               'Video Shorts',
//               'Insights',
//               'WORD',
//               'WHEEL',
//               'GAMES',
//             ]),
//             SizedBox(height: 20),

//             // All News Section
//             _buildSectionHeader('All News'),
//             _buildNewsItem(
//               title: 'Who all are in the core team preparing the Budget?',
//             ),
//             _buildNewsItem(
//               title: 'Stampede breaks out on biggest bathing day at Maha Kumbh, several injured',
//             ),
//             _buildNewsItem(
//               title: 'India lose a T20I at home after 426 days',
//             ),
//             SizedBox(height: 20),

//             // Top Stories Section
//             _buildSectionHeader('Top Stories'),
//             _buildNewsItem(
//               title: 'Top Story 1',
//             ),
//             _buildNewsItem(
//               title: 'Top Story 2',
//             ),
//             SizedBox(height: 20),

//             // Trending Section
//             _buildSectionHeader('Trending'),
//             _buildNewsItem(
//               title: 'Trending News 1',
//             ),
//             _buildNewsItem(
//               title: 'Trending News 2',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper method to build a section header
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   // Helper method to build a horizontal scrollable list
//   Widget _buildHorizontalScroll(List<String> items) {
//     return Container(
//       height: 50,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Chip(
//               label: Text(items[index]),
//               backgroundColor: Colors.blue[50],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Helper method to build a news item
//   Widget _buildNewsItem({required String title}) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: ListTile(
//         title: Text(title),
//         trailing: Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: () {
//           // Handle news item tap
//         },
//       ),
//     );
//   }
// }





























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
