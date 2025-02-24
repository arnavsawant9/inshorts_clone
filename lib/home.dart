// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Feed', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Breaking News: Flutter Simplifies Development!',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Flutter, Google’s UI toolkit, continues to revolutionize cross-platform development with its ease of use and efficiency.',
//               style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//             ),
//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }




















 ///// the latest updated code, this is working perfectly fineeeeeee
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import './api/news_api.dart';
// import './model/news_model.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<NewsModel> newsList = [];
//   NewsApi newsApi = NewsApi();

//   Future<void> getTopNews() async {
//     List<NewsModel> fetchedNews = await newsApi.getTopHeadlines('en');
//     setState(() {
//       newsList = fetchedNews;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getTopNews();
//   }

//   String formatDate(DateTime date) {
//     return DateFormat('d MMM yyyy').format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('News Feed', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Welcome back!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: newsList.isEmpty
//                   ? const Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                       itemCount: newsList.length,
//                       itemBuilder: (context, index) {
//                         return NewsCard(
//                           title: newsList[index].title,
//                           source: newsList[index].source,
//                           image: newsList[index].image,
//                           date: formatDate(newsList[index].publishedAt),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NewsCard extends StatelessWidget {
//   final String title, source, date, image;
//   const NewsCard({super.key, required this.title, required this.source, required this.date, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         leading: Image.network(image, width: 80, height: 80, fit: BoxFit.cover),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text('$source • $date'),
//         onTap: () {
//           // Navigate to news detail page (to be implemented)
//         },
//       ),
//     );
//   }
// }


































// this is for the test part
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
// import './api/news_api.dart';
// import './model/news_model.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<NewsModel> newsList = [];
//   NewsApi newsApi = NewsApi();

//   Future<void> getTopNews() async {
//     List<NewsModel> fetchedNews = await newsApi.getTopHeadlines('en');
//     setState(() {
//       newsList = fetchedNews.take(4).toList();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getTopNews();
//   }

//   String formatDate(DateTime date) {
//     return DateFormat('d MMM yyyy').format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: newsList.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : PageView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: newsList.length,
//               itemBuilder: (context, index) {
//                 return NewsPage(
//                   title: newsList[index].title,
//                   source: newsList[index].source,
//                   image: newsList[index].image,
//                   description: newsList[index].description,
//                   date: formatDate(newsList[index].publishedAt),
//                   url: newsList[index].url,
//                 );
//               },
//             ),
//     );
//   }
// }

// class NewsPage extends StatelessWidget {
//   final String? title, source, date, image, description, url;
//   const NewsPage({super.key, this.title, this.source, this.date, this.image, this.description, this.url});

//   void _launchURL() async {
//     if (url != null && await canLaunch(url!)) {
//       await launch(url!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         image: image != null && image!.isNotEmpty
//             ? DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover, opacity: 0.2)
//             : null,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             title ?? "No Title",
//             style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             '$source • $date',
//             style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: SingleChildScrollView(
//                 child: Text(
//                   description ?? "No Description Available",
//                   style: const TextStyle(fontSize: 16, color: Colors.black87),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: ElevatedButton(
//               onPressed: _launchURL,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//               child: const Text("Read More", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





























































import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './api/news_api.dart';
import './model/news_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsModel> newsList = [];
  NewsApi newsApi = NewsApi();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> getTopNews() async {
    List<NewsModel> fetchedNews = await newsApi.getTopHeadlines('en');
    setState(() {
      newsList = fetchedNews.take(4).toList();
    });
  }

  Future<void> addToBookmarks(NewsModel news) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).collection('bookmarks').doc(news.title).set({
        'title': news.title,
        'source': news.source,
        'image': news.image,
        'description': news.description,
        'date': news.publishedAt.toIso8601String(),
        'url': news.url,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTopNews();
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: newsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsPage(
                  news: newsList[index],
                  onBookmark: () => addToBookmarks(newsList[index]),
                );
              },
            ),
    );
  }
}

class NewsPage extends StatelessWidget {
  final NewsModel news;
  final VoidCallback onBookmark;

  const NewsPage({super.key, required this.news, required this.onBookmark});

  void _launchURL() async {
    if (news.url != null && await canLaunch(news.url!)) {
      await launch(news.url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        image: news.image != null && news.image!.isNotEmpty
            ? DecorationImage(image: NetworkImage(news.image!), fit: BoxFit.cover, opacity: 0.2)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            news.title ?? "No Title",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${news.source} • ${DateFormat('d MMM yyyy').format(news.publishedAt)}',
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  news.description ?? "No Description Available",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.bookmark_border, color: Colors.black),
                onPressed: onBookmark,
              ),
              ElevatedButton(
                onPressed: _launchURL,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text("Read More", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
