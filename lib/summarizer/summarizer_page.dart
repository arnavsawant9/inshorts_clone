// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class SummarizerPage extends StatefulWidget {
//   const SummarizerPage({Key? key}) : super(key: key);

//   @override 
//   State<SummarizerPage> createState() => _SummarizerPageState();
// }

// class _SummarizerPageState extends State<SummarizerPage> {
//   final TextEditingController _controller = TextEditingController();
//   String? summary;
//   bool isLoading = false;

//   Future<void> summarizeText(String text) async {
//     final String? apiKey = dotenv.env['HUGGINGFACE_API_KEY']; // Load from .env

//     final response = await http.post(
//       Uri.parse('https://api-inference.huggingface.co/models/facebook/bart-large-cnn'),
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'inputs': text}),
//     );

//     setState(() {
//       isLoading = false;
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         summary = data[0]['summary_text'];
//       } else {
//         summary = "Error: ${response.body}";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('AI Summarizer')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               maxLines: 8,
//               decoration: InputDecoration(
//                 hintText: "Paste article here...",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() => isLoading = true);
//                 summarizeText(_controller.text);
//               },
//               child: const Text("Summarize"),
//             ),
//             const SizedBox(height: 16),
//             if (isLoading) const CircularProgressIndicator(),
//             if (summary != null) Expanded(child: SingleChildScrollView(child: Text(summary!))),
//           ],
//         ),
//       ),
//     );
//   }
// }


















// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class SummarizerPage extends StatefulWidget {
//   const SummarizerPage({Key? key}) : super(key: key);

//   @override
//   State<SummarizerPage> createState() => _SummarizerPageState();
// }

// class _SummarizerPageState extends State<SummarizerPage> {
//   final TextEditingController _controller = TextEditingController();
//   String? summary;
//   bool isLoading = false;

//   Future<void> summarizeText(String text) async {
//     final String? apiKey = dotenv.env['HUGGINGFACE_API_KEY'];

//     final response = await http.post(
//       Uri.parse('https://api-inference.huggingface.co/models/facebook/bart-large-cnn'),
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'inputs': text}),
//     );

//     setState(() {
//       isLoading = false;
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         summary = data[0]['summary_text'];
//       } else {
//         summary = "Error: ${response.body}";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F6FB),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "AI News Summarizer 🧠",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 "Paste or type any article, and I’ll give you a short, smart summary.",
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Material(
//                 elevation: 3,
//                 borderRadius: BorderRadius.circular(14),
//                 child: TextField(
//                   controller: _controller,
//                   maxLines: 8,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: "Paste article here...",
//                     hintStyle: TextStyle(color: Colors.grey[600]),
//                     contentPadding: const EdgeInsets.all(16),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(14),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       isLoading = true;
//                       summary = null;
//                     });
//                     summarizeText(_controller.text);
//                   },
//                   icon: const Icon(Icons.auto_awesome),
//                   label: const Text("Summarize"),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     textStyle: const TextStyle(fontSize: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                     backgroundColor: Colors.deepPurple,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               if (isLoading)
//                 const Center(child: CircularProgressIndicator())
//               else if (summary != null)
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(14),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 6,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: SingleChildScrollView(
//                       child: Text(
//                         summary!,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.black87,
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





















import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SummarizerPage extends StatefulWidget {
  const SummarizerPage({Key? key}) : super(key: key);

  @override
  State<SummarizerPage> createState() => _SummarizerPageState();
}

class _SummarizerPageState extends State<SummarizerPage> {
  final TextEditingController _controller = TextEditingController();
  String? summary;
  bool isLoading = false;
  bool isUrlMode = false;

  Future<void> summarizeTextOrUrl(String input) async {
    setState(() {
      isLoading = true;
      summary = null;
    });

    String? textToSummarize;

    // if (isUrlMode) {
    //   final apiKey = dotenv.env['SCRAPINGBEE_API_KEY'];
    //   final scrapingResponse = await http.get(
    //     Uri.parse('https://app.scrapingbee.com/api/v1/?api_key=$apiKey&url=$input&extract_article=true'),
    //   );

    //   if (scrapingResponse.statusCode == 200) {
    //     final data = jsonDecode(scrapingResponse.body);
    //     textToSummarize = data['article']['content'];
    //     if (textToSummarize == null || textToSummarize.isEmpty) {
    //       setState(() {
    //         isLoading = false;
    //         summary = "Failed to extract article content from the URL.";
    //       });
    //       return;
    //     }
    //   } else {
    //     setState(() {
    //       isLoading = false;
    //       summary = "ScrapingBee error: ${scrapingResponse.body}";
    //     });
    //     return;
    //   }
    // } else {
    //   textToSummarize = input;
    // }



    if (isUrlMode) {
  final apiKey = dotenv.env['SCRAPINGBEE_API_KEY'];
  final targetUrl = Uri.encodeComponent(input);

  // Use extract_rules instead of deprecated extract_article
  final extractRules = Uri.encodeComponent('{"content":"article, .article-content, .story, .post-content"}');

  final scrapingUrl = Uri.parse(
    'https://app.scrapingbee.com/api/v1/?api_key=$apiKey&url=$targetUrl&render_js=false&extract_rules=$extractRules',
  );

  final scrapingResponse = await http.get(scrapingUrl);

  if (scrapingResponse.statusCode == 200) {
    final data = jsonDecode(scrapingResponse.body);
    textToSummarize = data['content'];

    if (textToSummarize == null || textToSummarize.isEmpty) {
      setState(() {
        isLoading = false;
        summary = "Failed to extract article content from the URL.";
      });
      return;
    }
  } else {
    setState(() {
      isLoading = false;
      summary = "ScrapingBee error: ${scrapingResponse.body}";
    });
    return;
  }
} else {
  textToSummarize = input;
}


    final hfResponse = await http.post(
      Uri.parse('https://api-inference.huggingface.co/models/facebook/bart-large-cnn'),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['HUGGINGFACE_API_KEY']}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'inputs': textToSummarize}),
    );

    setState(() {
      isLoading = false;
      if (hfResponse.statusCode == 200) {
        final summaryData = jsonDecode(hfResponse.body);
        summary = summaryData[0]['summary_text'];
      } else {
        summary = "Error summarizing: ${hfResponse.body}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "AI News Summarizer 🧠",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                isUrlMode
                    ? "Paste a news article URL, and I’ll summarize it for you."
                    : "Paste or type any article, and I’ll give you a smart summary.",
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Text"),
                  Switch(
                    value: isUrlMode,
                    onChanged: (val) {
                      setState(() {
                        isUrlMode = val;
                        _controller.clear();
                        summary = null;
                      });
                    },
                  ),
                  const Text("URL"),
                ],
              ),
              const SizedBox(height: 10),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(14),
                child: TextField(
                  controller: _controller,
                  maxLines: isUrlMode ? 2 : 8,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: isUrlMode ? "Paste article URL here..." : "Paste article text here...",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      summarizeTextOrUrl(_controller.text.trim());
                    }
                  },
                  icon: const Icon(Icons.auto_awesome),
                  label: const Text("Summarize"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else if (summary != null)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        summary!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
