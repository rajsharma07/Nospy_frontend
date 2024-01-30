import 'package:flutter/material.dart';
import 'package:nospy/login.dart';

class Register extends StatefulWidget {
  const Register(this.changepage, {super.key});
  final Function(Widget tochange) changepage;
  @override
  State<Register> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("NoSpy"),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text("Welcome to NoSpy"),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Register"),
              ),
              TextButton(
                  onPressed: () {
                    widget.changepage(Login(widget.changepage));
                  },
                  child: const Text("Login?"))
            ],
          ),
        ),
      ),
    );
  }
}
