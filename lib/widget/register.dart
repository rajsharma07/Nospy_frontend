import 'package:flutter/material.dart';
import 'package:nospy/widget/login.dart';
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
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passcodecontroler = TextEditingController();

  void registerapi()async{
    Map<String, String>js = {
      'name': namecontroler.text,
      'email':emailcontroler.text,
      'password':passcodecontroler.text
    };
    http.Response response = await ApiCall().postReq(js, "address");

  }

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
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome to NoSpy",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const TextField(
                decoration:
                    InputDecoration(label: Text('Name'), hintText: 'Name'),
              ),
              const TextField(
                decoration:
                    InputDecoration(label: Text('EmailId'), hintText: 'Email'),
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text('Passcode'), hintText: 'Passcode'),
              ),
              const TextField(
                decoration: InputDecoration(
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
