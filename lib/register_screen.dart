import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalapp/services/reg_controller/reg_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Hello", style: TextStyle(
                color: Colors.green,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),),
              Text("Register with us here:", style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),),

              SizedBox(height: 50,),

              TextFormField(
                controller: _emailController,
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

             SizedBox(height: 20,),

              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
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

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  try {
                    final RegController regController = RegController();

                    await regController.registerUser(
                      _emailController.text,
                      _passwordController.text,
                    );


                  } catch (e) {
                    debugPrint('Registration error: $e');
                  } finally {
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                child: isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}