// import 'dart:convert';
// import '../model/news_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class NewsApi {
//   Future<List<NewsModel>> getTopHeadlines(String lang) async {
//     // Make API call
//     // Parse JSON
//     // Return NewsModel object
//     final uri = Uri.parse(
//         'https://gnews.io/api/v4/top-headlines?category=business&country=in&lang=$lang&max=100&apikey=a96bce98719e5fe93e257c1f456697df');
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       debugPrint(response.body);
//       return jsonDecode(response.body)['articles']
//           .map<NewsModel>((json) => NewsModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
// }


// //my api key 
// //36d3c5703163e8e264c57a90ec1220a9
// // b878d42562bf4494adce38169c6d71e0 - ves api












import 'dart:convert';
import '../model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsApi {
  static final String _apiKey = dotenv.env['API_KEY'] ?? '';
  static const String _baseUrl = 'https://gnews.io/api/v4';

  // Get top headlines
  Future<List<NewsModel>> getTopHeadlines(String lang) async {
    final uri = Uri.parse(
        '$_baseUrl/top-headlines?category=business&country=in&lang=$lang&max=100&apikey=$_apiKey');
    
    return _fetchNews(uri);
  }

  // **Newly Added**: Search news by query
  Future<List<NewsModel>> searchNews(String query) async {
    final uri = Uri.parse(
        '$_baseUrl/search?q=$query&lang=en&max=100&apikey=$_apiKey');
    
    return _fetchNews(uri);
  }

  // Helper method to fetch and parse news
  Future<List<NewsModel>> _fetchNews(Uri uri) async {
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['articles'] as List)
            .map<NewsModel>((json) => NewsModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      debugPrint('Error fetching news: $e');
      throw Exception('Network error');
    }
  }
}
