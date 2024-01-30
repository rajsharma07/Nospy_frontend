import 'package:flutter/material.dart';
import 'package:nospy/register.dart';

class Login extends StatefulWidget {
  const Login(this.changepage, {super.key});
  final Function(Widget tochange) changepage;
  @override
  State<Login> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 187, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 220, 202, 250),
        title: const Center(
          child: Text("NoSpy"),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(),
              const SizedBox(
                height: 20,
              ),
              TextFormField(),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  widget.changepage(Register(widget.changepage));
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
