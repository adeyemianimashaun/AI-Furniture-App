import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/authentification/au.dart';


class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  bool isLogin = true;

  final AuthService _auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // LOGIN / REGISTER FUNCTION
  Future<void> handleAuth() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email and Password are required"),
        ),
      );
      return;
    }

    User? user;

    if (isLogin) {
      // LOGIN
      user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      // REGISTER
      if (firstName.isEmpty || lastName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("First Name and Last Name are required"),
          ),
        );
        return;
      }

      user = await _auth.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
    }

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isLogin ? "Login Successful" : "Registration Successful",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isLogin ? "Login Failed" : "Registration Failed",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                isLogin
                    ? 'Login to continue shopping'
                    : 'Create your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 40),

              if (!isLogin) ...[
                _buildTextField(
                  controller: firstNameController,
                  hint: 'First Name',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 16),

                _buildTextField(
                  controller: lastNameController,
                  hint: 'Last Name',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 16),
              ],

              _buildTextField(
                controller: emailController,
                hint: 'Email Address',
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: passwordController,
                hint: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: handleAuth,
                  child: Text(
                    isLogin ? 'Login' : 'Sign Up',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? "Don't have an account? Sign Up"
                        : "Already have an account? Login",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}