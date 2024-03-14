import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(IOWebSocketChannel.connect('ws://echo.websocket.org')),
    );
  }
}

class MyHome extends StatefulWidget {
  final WebSocketChannel channel;
  MyHome(this.channel);
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('websocket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(child: TextFormField())
          ],
        ),
      ),
    );
  }
}
