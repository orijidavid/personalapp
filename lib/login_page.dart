import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personalapp/register_screen.dart';
import 'package:personalapp/services/auth_controller/auth_controller.dart';
import 'package:personalapp/test_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create these ONCE and keep them for the lifetime of the State.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = AuthController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // Validate the form first.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      // Firebase login is asynchronous.
      final User? result = await _authController.login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (!mounted) return;

      // Login was successful.
      if (result != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TestPage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Login failed'),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen', style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
            ),),
                Text("Glad to see you again", style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),),

                Padding(padding: EdgeInsets.fromLTRB(118, 10, 0, 10),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.person, size: 50, color: Colors.white,)
                  ),
                ),
        
                SizedBox(height: 20,),
        
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.green),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.green,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
        
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
        
                    return null;
                  },
                ),
        
                const SizedBox(height: 16),
        
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    prefixIconColor: Colors.green,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )
        
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
        
                    return null;
                  },
                ),
        
                const SizedBox(height: 20),
        
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
        
                SizedBox(height: 20,),
        
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      SizedBox(width: 5,),
                      const Text('Register', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                    ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
