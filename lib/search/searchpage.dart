import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // this is for handling the notifications here!!
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Feed Section
            _buildSectionHeader('My Feed'),
            _buildHorizontalScroll([
              'Roundups',
              'Video Shorts',
              'Insights',
              'WORD',
              'WHEEL',
              'GAMES',
            ]),
            SizedBox(height: 20),

            // All News Section
            _buildSectionHeader('All News'),
            _buildNewsItem(
              title: 'Who all are in the core team preparing the Budget?',
            ),
            _buildNewsItem(
              title: 'Stampede breaks out on biggest bathing day at Maha Kumbh, several injured',
            ),
            _buildNewsItem(
              title: 'India lose a T20I at home after 426 days',
            ),
            SizedBox(height: 20),

            // Top Stories Section
            _buildSectionHeader('Top Stories'),
            _buildNewsItem(
              title: 'Top Story 1',
            ),
            _buildNewsItem(
              title: 'Top Story 2',
            ),
            SizedBox(height: 20),

            // Trending Section
            _buildSectionHeader('Trending'),
            _buildNewsItem(
              title: 'Trending News 1',
            ),
            _buildNewsItem(
              title: 'Trending News 2',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a section header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to build a horizontal scrollable list
  Widget _buildHorizontalScroll(List<String> items) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(items[index]),
              backgroundColor: Colors.blue[50],
            ),
          );
        },
      ),
    );
  }

  // Helper method to build a news item
  Widget _buildNewsItem({required String title}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle news item tap
        },
      ),
    );
  }
}