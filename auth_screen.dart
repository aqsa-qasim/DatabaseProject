import 'package:aqsaqasim8579/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      _emailController.text = savedEmail;
      _passwordController.text = savedPassword;
      // Attempt auto-login
      try {
        await _auth.signInWithEmailAndPassword(
          email: savedEmail,
          password: savedPassword,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Auto-login successful")),
        );
        _goToHomePage();
      } catch (e) {
        // ignore auto-login failure
      }
    }
  }

  Future<void> _saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<void> _clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fill all fields")),
      );
      return;
    }

    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        await _saveCredentials(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful")),
        );
      } else {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await _saveCredentials(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Sign Up successful")),
        );
      }
      _goToHomePage();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _clearCredentials();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Signed out")),
    );
  }

  void _goToHomePage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = _auth.currentUser != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth'),
        actions: [
          if (isAuthenticated)
            IconButton(onPressed: _signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(12),
                    isSelected: [isLogin, !isLogin],
                    onPressed: (int index) {
                      setState(() => isLogin = index == 0);
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Login"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _submit,
                      icon: Icon(isLogin ? Icons.login : Icons.person_add),
                      label: Text(isLogin ? 'Login' : 'Sign Up'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
