// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'login.dart'; // Ensure you have this screen
// import '../main.dart';
// import '../home.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _signup() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         User? user = userCredential.user;
//         if (user != null) {
//           await _firestore.collection("users").doc(user.uid).set({
//             'username': usernameController.text.trim(),
//             'email': emailController.text.trim(),
//             'createdAt': Timestamp.now(),
//           });

//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => MyApp()),
//           );
//         }
//       } catch (e) {
//         _showErrorDialog(e);
//       }
//     }
//   }

//   void _showErrorDialog(dynamic error) {
//     String errorMessage = "Signup failed. Please try again.";

//     if (error is FirebaseAuthException) {
//       if (error.code == 'email-already-in-use') {
//         errorMessage = "User already exists. Please log in.";
//       } else if (error.code == 'weak-password') {
//         errorMessage = "Password must be at least 6 characters.";
//       } else if (error.code == 'invalid-email') {
//         errorMessage = "Invalid email format.";
//       }
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Signup Failed"),
//         content: Text(errorMessage),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 32.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.jpg', height: 80),
//                 SizedBox(height: 40),

//                 _buildTextField(controller: usernameController, label: "Username"),
//                 SizedBox(height: 10),
//                 _buildTextField(controller: emailController, label: "Email", keyboardType: TextInputType.emailAddress),
//                 SizedBox(height: 10),
//                 _buildTextField(controller: passwordController, label: "Password", obscureText: true),
//                 SizedBox(height: 20),

//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _signup,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Sign Up", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an account? "),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//                       },
//                       child: Text("Login here", style: TextStyle(color: Colors.blue)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "$label cannot be empty";
//         }
//         return null;
//       },
//     );
//   }
// }



















import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import '../main.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        User? user = userCredential.user;
        if (user != null) {
          await user.sendEmailVerification();

          await _firestore.collection("users").doc(user.uid).set({
            'username': usernameController.text.trim(),
            'email': emailController.text.trim(),
            'createdAt': Timestamp.now(),
          });

          _showInfoDialog(
            "Verification email sent. Please check your inbox and verify your email before logging in.",
          );
        }
      } catch (e) {
        _showErrorDialog(e);
      }
    }
  }

  void _showInfoDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Email Verification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(dynamic error) {
    String errorMessage = "Signup failed. Please try again.";

    if (error is FirebaseAuthException) {
      if (error.code == 'email-already-in-use') {
        errorMessage = "User already exists. Please log in.";
      } else if (error.code == 'weak-password') {
        errorMessage = "Password must be at least 6 characters.";
      } else if (error.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Signup Failed"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.jpg', height: 80),
                SizedBox(height: 40),
                _buildTextField(controller: usernameController, label: "Username"),
                SizedBox(height: 10),
                _buildTextField(controller: emailController, label: "Email", keyboardType: TextInputType.emailAddress),
                SizedBox(height: 10),
                _buildTextField(controller: passwordController, label: "Password", obscureText: true),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Sign Up", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Text("Login here", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label cannot be empty";
        }
        return null;
      },
    );
  }
}
