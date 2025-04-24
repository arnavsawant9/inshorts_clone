// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   TextEditingController nameController = TextEditingController(text: "Arnav");
//   TextEditingController bioController = TextEditingController();

//   int nameMaxLength = 20;
//   int bioMaxLength = 120;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Picture
//             Center(
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/logo.jpg'), // Replace with your image
//               ),
//             ),
//             SizedBox(height: 20),

//             // Name Field
//             _buildLabel("Name"),
//             TextField(
//               controller: nameController,
//               maxLength: nameMaxLength,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             _buildCharacterLimit(nameController.text.length, nameMaxLength),

//             SizedBox(height: 16),

//             // Bio Field
//             _buildLabel("Your Bio"),
//             TextField(
//               controller: bioController,
//               maxLength: bioMaxLength,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter your bio here",
//               ),
//             ),
//             _buildCharacterLimit(bioController.text.length, bioMaxLength),

//             SizedBox(height: 20),

//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper to create labels
//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//     );
//   }

//   // Character counter
//   Widget _buildCharacterLimit(int current, int max) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Text("$current/$max", style: TextStyle(color: Colors.grey, fontSize: 12)),
//     );
//   }
// }
























// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   bool _isLoading = false;

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (userDoc.exists) {
//           setState(() {
//             nameController.text = userDoc['username'] ?? "";
//             bioController.text = userDoc['bio'] ?? "";
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching user data: $e");
//     }
//   }

//   Future<void> _updateProfile() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
//           'username': nameController.text.trim(),
//           'bio': bioController.text.trim(),
//         });

//         Navigator.pop(context, true); // Go back to ProfileScreen with success flag
//       }
//     } catch (e) {
//       print("Error updating profile: $e");
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFE3F2FD),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Picture
//             Center(
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage('assets/logo.jpg'),
//               ),
//             ),
//             SizedBox(height: 20),

//             // Name Field
//             _buildLabel("Name"),
//             TextField(
//               controller: nameController,
//               maxLength: 20,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),

//             SizedBox(height: 16),

//             // Bio Field
//             _buildLabel("Your Bio"),
//             TextField(
//               controller: bioController,
//               maxLength: 120,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter your bio here",
//               ),
//             ),

//             SizedBox(height: 20),

//             // Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _isLoading ? null : _updateProfile,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                 ),
//                 child: _isLoading
//                     ? CircularProgressIndicator(color: Colors.white)
//                     : Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            nameController.text = userDoc['username'] ?? "";
            bioController.text = userDoc['bio'] ?? "";
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> _updateProfile() async {
    setState(() => _isLoading = true);

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
          'username': nameController.text.trim(),
          'bio': bioController.text.trim(),
        });

        Navigator.pop(context, true);
      }
    } catch (e) {
      print("Error updating profile: $e");
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Custom Top Bar
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
              const SizedBox(height: 24),

              // Name Field
              _buildLabel("Name"),
              TextField(
                controller: nameController,
                maxLength: 20,
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 20),

              // Bio Field
              _buildLabel("Bio"),
              TextField(
                controller: bioController,
                maxLength: 120,
                maxLines: 3,
                decoration: _inputDecoration(hintText: "Enter your bio here"),
              ),
              const SizedBox(height: 30),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _updateProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save Changes",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  InputDecoration _inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      counterText: "",
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }
}
