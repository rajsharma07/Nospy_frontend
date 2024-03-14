import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nospy/nospy.dart';
import 'package:nospy/widget/authentication/register.dart';
import 'package:nospy/api_methods/api_call.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login(this.changepage, {super.key});
  final Function(Widget tochange) changepage;
  @override
  State<Login> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  var emailcontroler = TextEditingController();
  var passcodecontroler = TextEditingController();
  var namecontroller = TextEditingController();

  void alertbox() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Wrong Credential'),
              content: const Text('Check your credentials!!!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  void enterApp(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NoSpy(),
        ),
      );
  }

  void loginapi() async {
    final pref = await SharedPreferences.getInstance();
    Map<String, String> js = {
      'name': namecontroller.text,
      'email': emailcontroler.text,
      'password': passcodecontroler.text
    };
    http.Response response = await ApiCall().postReq(js, '/api/v1/auth/login');
    Map<String, dynamic> m = jsonDecode(response.body);
    if (response.statusCode == 200) {
      pref.setString('jwt_token', m['token']);
      enterApp();
    } else {
      alertbox();
    }
  }

  @override
  void dispose() {
    emailcontroler.dispose();
    passcodecontroler.dispose();
    super.dispose();
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
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  label: Text('Name'),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailcontroler,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passcodecontroler,
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Passcode'),
                  hintText: 'Passcode',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: loginapi,
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
