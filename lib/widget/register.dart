import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nospy/widget/login.dart';
import 'package:nospy/widget/nospy.dart';
import 'package:http/http.dart' as http;
import 'package:nospy/api_methods/api_call.dart';

class Register extends StatefulWidget {
  const Register(this.changepage, {super.key});
  final Function(Widget tochange) changepage;
  @override
  State<Register> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  var namecontroler = TextEditingController();
  var emailcontroler = TextEditingController();
  var passcodecontroler = TextEditingController();

  void registerapi() async {
    Map<String, String> js = {
      'name': namecontroler.text,
      'email': emailcontroler.text,
      'password': passcodecontroler.text
    };
    http.Response response =
        await ApiCall().postReq(js, '/api/v1/auth/register');
    String decodedResponse = response.body;

    Map<String, dynamic> m = jsonDecode(decodedResponse);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NoSpy()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to NoSpy",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: namecontroler,
                decoration:
                    const InputDecoration(label: Text('Name'), hintText: 'Name'),
              ),
              TextField(
                controller: emailcontroler,
                decoration:
                    const InputDecoration(label: Text('EmailId'), hintText: 'Email'),
              ),
              TextField(
                controller: passcodecontroler,
                decoration: const InputDecoration(
                    label: Text('Passcode'), hintText: 'Passcode'),
              ),
              TextField(
                controller: passcodecontroler,
                decoration: const InputDecoration(
                  label: Text('Confirm Passcode'),
                  hintText: 'Confirm Passcode',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: registerapi,
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
