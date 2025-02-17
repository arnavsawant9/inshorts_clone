import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController(text: "Arnav");
  TextEditingController bioController = TextEditingController();

  int nameMaxLength = 20;
  int bioMaxLength = 120;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image
              ),
            ),
            SizedBox(height: 20),

            // Name Field
            _buildLabel("Name"),
            TextField(
              controller: nameController,
              maxLength: nameMaxLength,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            _buildCharacterLimit(nameController.text.length, nameMaxLength),

            SizedBox(height: 16),

            // Bio Field
            _buildLabel("Your Bio"),
            TextField(
              controller: bioController,
              maxLength: bioMaxLength,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your bio here",
              ),
            ),
            _buildCharacterLimit(bioController.text.length, bioMaxLength),

            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to create labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  // Character counter
  Widget _buildCharacterLimit(int current, int max) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text("$current/$max", style: TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }
}
