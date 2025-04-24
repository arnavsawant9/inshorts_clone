// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
  
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
//                 // Logo
//                 Image.asset(
//                   'assets/logo.jpg', // Replace with your logo asset
//                   height: 80,
//                 ),
//                 SizedBox(height: 40),

//                 // Username Field
//                 _buildTextField(controller: usernameController, label: "Username"),
//                 SizedBox(height: 10),

//                 // Email Field
//                 _buildTextField(controller: emailController, label: "Email", keyboardType: TextInputType.emailAddress),
//                 SizedBox(height: 10),

//                 // Password Field
//                 _buildTextField(controller: passwordController, label: "Password", obscureText: true),
//                 SizedBox(height: 20),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Handle login logic
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Social Login Buttons
//                 _buildLoginButton(
//                   color: Color(0xFF1877F2),
//                   text: "Sign in with Facebook",
//                   icon: Icons.facebook,
//                 ),
//                 SizedBox(height: 10),
//                 _buildLoginButton(
//                   color: Colors.white,
//                   text: "Sign in with Google",
//                   icon: Icons.g_mobiledata,
//                   borderColor: Colors.grey,
//                   textColor: Colors.black,
//                 ),
//                 SizedBox(height: 10),
//                 _buildLoginButton(
//                   color: Colors.blue,
//                   text: "Sign in with phone",
//                   icon: Icons.phone,
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

//   Widget _buildLoginButton({
//     required Color color,
//     required String text,
//     required IconData icon,
//     Color textColor = Colors.white,
//     Color? borderColor,
//   }) {
//     return Container(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         icon: Icon(icon, color: textColor),
//         label: Text(
//           text,
//           style: TextStyle(color: textColor),
//         ),
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           padding: EdgeInsets.symmetric(vertical: 14),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//             side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }






















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../home.dart'; // Ensure you have a home screen to navigate after login

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         if (userCredential.user != null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//           );
//         }
//       } catch (e) {
//         _showErrorDialog("Invalid credentials. Please try again.");
//       }
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Login Failed"),
//         content: Text(message),
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

//                 // Email Field
//                 _buildTextField(
//                   controller: emailController,
//                   label: "Email",
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 10),

//                 // Password Field
//                 _buildTextField(
//                   controller: passwordController,
//                   label: "Password",
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 20),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Forgot Password & Register Links
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {}, // TODO: Implement forgot password
//                       child: Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
//                     ),
//                     Text(" | "),
//                     TextButton(
//                       onPressed: () {}, // TODO: Navigate to signup
//                       child: Text("Register here", style: TextStyle(color: Colors.blue)),
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










































//  the only login page that is working here !!!!!!!!!!!!!!!!!!!!!!!!!!!


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         // ✅ No manual navigation needed, `AuthWrapper` in main.dart will handle redirection
//       } catch (e) {
//         _showErrorDialog("Invalid credentials. Please try again.");
//       }
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Login Failed"),
//         content: Text(message),
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

//                 // Email Field
//                 _buildTextField(
//                   controller: emailController,
//                   label: "Email",
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 10),

//                 // Password Field
//                 _buildTextField(
//                   controller: passwordController,
//                   label: "Password",
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 20),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Forgot Password & Register Links
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {}, // TODO: Implement forgot password
//                       child: Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
//                     ),
//                     Text(" | "),
//                     TextButton(
//                       onPressed: () {}, // TODO: Navigate to signup
//                       child: Text("Register here", style: TextStyle(color: Colors.blue)),
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













































// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'signup.dart'; // Import the SignupPage
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //final GoogleSignIn googleSignIn = GoogleSignIn();
//   //writing the below code for google authentication
//   // Future<User?> signInWithGoogle() async {
//   //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//   //   if(googleUser != null){
//   //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//   //     final AuthCredential credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );
//   //     final UserCredential userCredential = await _auth.signInWithCredential(credential);
//   //     return userCredential.user;
//   //   }
//   //   return null;
//   // }


// //   // --------------------> the updated code for google auth by claude----------------->
// //   // At the top of your file where you define your variables
// // final GoogleSignIn googleSignIn = GoogleSignIn(
// //   clientId: '215780806727-anknbte1anacjt75vuhi1ggqp925mbde.apps.googleusercontent.com ',
// // );

// // // Your existing signInWithGoogle method stays the same
// // Future<User?> signInWithGoogle() async {
// //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
// //   if(googleUser != null){
// //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
// //     final AuthCredential credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth.accessToken,
// //       idToken: googleAuth.idToken,
// //     );
// //     final UserCredential userCredential = await _auth.signInWithCredential(credential);
// //     return userCredential.user;
// //   }
// //   return null;
// // }
// // // --------------------> the updated code for google auth by claude----------------->



  

// Future<User?> signInWithGoogle() async {
//   try {
//     // Initialize GoogleSignIn with clientId only on web
//     final GoogleSignIn googleSignIn = GoogleSignIn(
//       clientId: kIsWeb
//           ? 'YOUR-WEB-CLIENT-ID-HERE.apps.googleusercontent.com' // 🔁 Replace with your real Web Client ID
//           : null,
//     );

//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser == null) return null;

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     return userCredential.user;
//   } catch (e) {
//     print("Google Sign-In Error: $e");
//     return null;
//   }
// }


//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         // ✅ No manual navigation needed, `AuthWrapper` in main.dart will handle redirection
//       } catch (e) {
//         _showErrorDialog("Invalid credentials. Please try again.");
//       }
//     }
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Login Failed"),
//         content: Text(message),
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

//                 // Email Field
//                 _buildTextField(
//                   controller: emailController,
//                   label: "Email",
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 10),

//                 // Password Field
//                 _buildTextField(
//                   controller: passwordController,
//                   label: "Password",
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 20),

//                 // Login Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Forgot Password & Register Links
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => SignupScreen()), // Navigates to SignupPage
//                         );
//                       },
//                       child: Text("Register here", style: TextStyle(color: Colors.blue)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),



//                 //google sign-in button
//                 SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     User? user = await signInWithGoogle();
//                     if (user != null) {
//                       print('Logged in as: ${user.displayName}');
//                       // Navigate to home screen or next page
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white, // Google button color
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     side: BorderSide(color: Colors.grey),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Sign in with Google',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
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
import 'package:google_sign_in/google_sign_in.dart';
import 'signup.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (!userCredential.user!.emailVerified) {
          await _auth.signOut();
          _showErrorDialog("Please verify your email before logging in.");
        } else {
          // AuthWrapper will auto-redirect
        }
      } catch (e) {
        _showErrorDialog("Invalid credentials. Please try again.");
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: kIsWeb
            ? 'YOUR-WEB-CLIENT-ID-HERE.apps.googleusercontent.com'
            : null,
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
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
                _buildTextField(controller: emailController, label: "Email", keyboardType: TextInputType.emailAddress),
                SizedBox(height: 10),
                _buildTextField(controller: passwordController, label: "Password", obscureText: true),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text("Register here", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      User? user = await signInWithGoogle();
                      if (user != null) {
                        print('Logged in as: ${user.displayName}');
                        // Redirect to home screen
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sign in with Google', style: TextStyle(color: Colors.black, fontSize: 16)),
                      ],
                    ),
                  ),
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
