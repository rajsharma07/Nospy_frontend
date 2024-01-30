import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("NoSpy"),
        ),
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Login"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Register"),
          )
        ],
      ),
    );
  }
}
