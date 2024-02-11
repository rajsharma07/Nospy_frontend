import 'package:flutter/material.dart';
import 'package:nospy/widget/register.dart';
import 'package:nospy/api_methods/api_call.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login(this.changepage, {super.key});
  final Function(Widget tochange) changepage;
  @override
  State<Login> createState() {
    return _Login();
  }
}
class _Login extends State<Login> {
  var emailcontroler =  TextEditingController();
  var passcodecontroler = TextEditingController();
  void loginapi()async{
    Map<String, String>js = {
      'email': emailcontroler.text,
      'password': passcodecontroler.text
    };
    http.Response response = await ApiCall().postReq(js, "address");

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
