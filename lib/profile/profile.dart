// // import 'package:flutter/material.dart';
// // import 'editprofile.dart';

// // class ProfileScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () {}, 
// //             child: Text("Feedback", style: TextStyle(color: Colors.black)),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.settings, color: Colors.black),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           SizedBox(height: 10),
          
// //           // Profile Picture
// //           Center(
// //             child: Column(
// //               children: [
// //                 CircleAvatar(
// //                   radius: 40,
// //                   backgroundImage: AssetImage('assets/logo.jpg'), // Replace with your image
// //                 ),
// //                 SizedBox(height: 10),
// //                 Text("Arnav", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                 SizedBox(height: 5),

// //                 // Edit Profile Button
// //                 ElevatedButton.icon(
// //                   onPressed: () {
// //                    Navigator.push(
// //                  context,
// //                 MaterialPageRoute(builder: (context) => EditProfileScreen()),
// //                );
// //                    },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.grey[200],
// //                     foregroundColor: Colors.black,
// //                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                   ),
// //                   icon: Icon(Icons.edit, size: 16),
// //                   label: Text("Edit Profile"),
// //                 ),
// //               ],
// //             ),
// //           ),

// //           SizedBox(height: 20),

// //           // My Bookmarks Section
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 20),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text("My Bookmarks", 
// //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                 Container(
// //                   width: 40,
// //                   height: 2,
// //                   color: Colors.blue,
// //                   margin: EdgeInsets.only(top: 3, bottom: 10),
// //                 ),

// //                 SizedBox(height: 20),

// //                 // Empty Bookmarks Message
// //                 Center(
// //                   child: Column(
// //                     children: [
// //                       Text("It's Empty Here", 
// //                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //                       SizedBox(height: 5),
// //                       Text(
// //                         "Click on the bookmark icon to bookmark a short",
// //                         textAlign: TextAlign.center,
// //                         style: TextStyle(color: Colors.grey, fontFamily: 'GrechenFuemen', fontSize: 25),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Image.network('https://www.shutterstock.com/image-vector/vector-flat-illustration-no-bookmarks-260nw-2298489655.jpg', width: 200,height: 200,fit: BoxFit.fitWidth,),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }






























// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'editprofile.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String username = "Loading...";

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsername();
//   }

//   Future<void> _fetchUsername() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       if (userDoc.exists) {
//         setState(() {
//           username = userDoc['username'] ?? "No Name";
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: Text("Feedback", style: TextStyle(color: Colors.black)),
//           ),
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 10),
          
//           // Profile Picture & Username
//           Center(
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundImage: AssetImage('assets/logo.jpg'),
//                 ),
//                 SizedBox(height: 10),
//                 Text(username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 5),

//                 // Edit Profile Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditProfileScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[200],
//                     foregroundColor: Colors.black,
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   icon: Icon(Icons.edit, size: 16),
//                   label: Text("Edit Profile"),
//                 ),
//               ],
//             ),
//           ),

//           SizedBox(height: 20),

//           // My Bookmarks Section
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("My Bookmarks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Container(
//                   width: 40,
//                   height: 2,
//                   color: Colors.blue,
//                   margin: EdgeInsets.only(top: 3, bottom: 10),
//                 ),
//                 SizedBox(height: 20),
                
//                 Center(
//                   child: Column(
//                     children: [
//                       Text("It's Empty Here", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 5),
//                       Text(
//                         "Click on the bookmark icon to bookmark a short",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.grey, fontFamily: 'GrechenFuemen', fontSize: 25),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.network(
//                   'https://www.shutterstock.com/image-vector/vector-flat-illustration-no-bookmarks-260nw-2298489655.jpg',
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.fitWidth,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




















































/// the original working one

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'editprofile.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String _username = "Loading...";
//   bool _isLoading = true;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsername();
//   }

//   Future<void> _fetchUsername() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc =
//             await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

//         if (userDoc.exists && userDoc.data() != null) {
//           setState(() {
//             _username = userDoc['username'] ?? "No Name";
//             _isLoading = false;
//           });
//         } else {
//           setState(() {
//             _username = "No Name Found";
//             _isLoading = false;
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching username: $e");
//       setState(() {
//         _username = "Error Loading";
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {}, 
//             child: Text("Feedback", style: TextStyle(color: Colors.black)),
//           ),
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 10),
          
//           // Profile Picture & Username
//           Center(
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundImage: AssetImage('assets/logo.jpg'),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   _isLoading ? "Loading..." : _username,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),

//                 // Edit Profile Button
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditProfileScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[200],
//                     foregroundColor: Colors.black,
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   icon: Icon(Icons.edit, size: 16),
//                   label: Text("Edit Profile"),
//                 ),
//               ],
//             ),
//           ),

//           SizedBox(height: 20),

//           // My Bookmarks Section
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("My Bookmarks", 
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Container(
//                   width: 40,
//                   height: 2,
//                   color: Colors.blue,
//                   margin: EdgeInsets.only(top: 3, bottom: 10),
//                 ),

//                 SizedBox(height: 20),

//                 // Empty Bookmarks Message
//                 Center(
//                   child: Column(
//                     children: [
//                       Text("It's Empty Here", 
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       SizedBox(height: 5),
//                       Text(
//                         "Click on the bookmark icon to bookmark a short",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.grey, fontFamily: 'GrechenFuemen', fontSize: 25),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.network('https://www.shutterstock.com/image-vector/vector-flat-illustration-no-bookmarks-260nw-2298489655.jpg', width: 200,height: 200,fit: BoxFit.fitWidth,),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

































































// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'editprofile.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String _username = "Loading...";
//   bool _isLoading = true;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   List<Map<String, dynamic>> _bookmarks = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsername();
//     _fetchBookmarks();
//   }

//   Future<void> _fetchUsername() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc =
//             await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

//         if (userDoc.exists && userDoc.data() != null) {
//           setState(() {
//             _username = userDoc['username'] ?? "No Name";
//             _isLoading = false;
//           });
//         } else {
//           setState(() {
//             _username = "No Name Found";
//             _isLoading = false;
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching username: $e");
//       setState(() {
//         _username = "Error Loading";
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchBookmarks() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         QuerySnapshot snapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .collection('bookmarks')
//             .get();

//         setState(() {
//           _bookmarks = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//         });
//       }
//     } catch (e) {
//       print("Error fetching bookmarks: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 10),
//           Center(
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundImage: AssetImage('assets/logo.jpg'),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   _isLoading ? "Loading..." : _username,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditProfileScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[200],
//                     foregroundColor: Colors.black,
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   icon: Icon(Icons.edit, size: 16),
//                   label: Text("Edit Profile"),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("My Bookmarks", 
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Container(
//                   width: 40,
//                   height: 2,
//                   color: Colors.blue,
//                   margin: EdgeInsets.only(top: 3, bottom: 10),
//                 ),
//                 _bookmarks.isEmpty
//                     ? Center(
//                         child: Column(
//                           children: [
//                             Text("It's Empty Here", 
//                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                             SizedBox(height: 5),
//                             Text(
//                               "Click on the bookmark icon to bookmark a short",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(color: Colors.grey, fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: _bookmarks.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(_bookmarks[index]['title']),
//                             subtitle: Text(_bookmarks[index]['source'] ?? "Unknown"),
//                           );
//                         },
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





























































// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'editprofile.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String _username = "Loading...";
//   bool _isLoading = true;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   List<Map<String, dynamic>> _bookmarks = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     User? user = _auth.currentUser;
//     if (user == null) return;

//     try {
//       DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

//       setState(() {
//         _username = data?['username'] ?? "No Name Available";
//         _isLoading = false;
//       });

//       await _fetchBookmarks(user.uid);
//     } catch (e) {
//       print("Error fetching user data: $e");
//       setState(() {
//         _username = "Error Loading";
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchBookmarks(String userId) async {
//     try {
//       QuerySnapshot snapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .collection('bookmarks')
//           .get();

//       setState(() {
//         _bookmarks = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//       });
//     } catch (e) {
//       print("Error fetching bookmarks: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 10),
//           Center(
//             child: Column(
//               children: [
//                 const CircleAvatar(
//                   radius: 40,
//                   backgroundImage: AssetImage('assets/logo.jpg'),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   _isLoading ? "Loading..." : _username,
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditProfileScreen()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[200],
//                     foregroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   icon: const Icon(Icons.edit, size: 16),
//                   label: const Text("Edit Profile"),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("My Bookmarks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 Container(
//                   width: 40,
//                   height: 2,
//                   color: Colors.blue,
//                   margin: const EdgeInsets.only(top: 3, bottom: 10),
//                 ),
//                 _bookmarks.isEmpty
//                     ? Center(
//                         child: Column(
//                           children: const [
//                             Text("It's Empty Here", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                             SizedBox(height: 5),
//                             Text(
//                               "Click on the bookmark icon to bookmark a short",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(color: Colors.grey, fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: _bookmarks.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(_bookmarks[index]['title']),
//                             subtitle: Text(_bookmarks[index]['source'] ?? "Unknown"),
//                           );
//                         },
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






































import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'editprofile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = "Loading...";
  String _bio = "";
  bool _isLoading = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> _bookmarks = [];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      Map<String, dynamic>? data = userDoc.data() as Map<String, dynamic>?;

      setState(() {
        _username = data?['username'] ?? "No Name Available";
        _bio = data?['bio'] ?? "No bio available";
        _isLoading = false;
      });

      await _fetchBookmarks(user.uid);
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        _username = "Error Loading";
        _bio = "Error loading bio";
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchBookmarks(String userId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('bookmarks')
          .get();

      setState(() {
        _bookmarks = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    } catch (e) {
      print("Error fetching bookmarks: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/logo.jpg'), // Make sure this path is correct
                ),
                const SizedBox(height: 10),
                Text(
                  _isLoading ? "Loading..." : _username,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  _isLoading ? "Loading..." : _bio,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileScreen()),
                    );

                    if (result == true) {
                      _fetchUserData(); // Refresh profile after returning from edit screen
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text("Edit Profile"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("My Bookmarks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  width: 40,
                  height: 2,
                  color: Colors.blue,
                  margin: const EdgeInsets.only(top: 3, bottom: 10),
                ),
                _bookmarks.isEmpty
                    ? Center(
                        child: Column(
                          children: const [
                            Text("It's Empty Here", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(
                              "Click on the bookmark icon to bookmark a short",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _bookmarks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_bookmarks[index]['title']),
                            subtitle: Text(_bookmarks[index]['source'] ?? "Unknown"),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

