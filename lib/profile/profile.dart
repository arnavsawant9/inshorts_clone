import 'package:flutter/material.dart';
import 'editprofile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {}, 
            child: Text("Feedback", style: TextStyle(color: Colors.black)),
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          
          // Profile Picture
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/logo.jpg'), // Replace with your image
                ),
                SizedBox(height: 10),
                Text("Arnav", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),

                // Edit Profile Button
                ElevatedButton.icon(
                  onPressed: () {
                   Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
               );
                   },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Icon(Icons.edit, size: 16),
                  label: Text("Edit Profile"),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // My Bookmarks Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Bookmarks", 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  width: 40,
                  height: 2,
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 3, bottom: 10),
                ),

                SizedBox(height: 20),

                // Empty Bookmarks Message
                Center(
                  child: Column(
                    children: [
                      Text("It's Empty Here", 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(
                        "Click on the bookmark icon to bookmark a short",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontFamily: 'GrechenFuemen', fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Image.network('https://www.shutterstock.com/image-vector/vector-flat-illustration-no-bookmarks-260nw-2298489655.jpg', width: 200,height: 200,fit: BoxFit.fitWidth,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

