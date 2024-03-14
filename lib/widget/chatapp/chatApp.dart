// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:nospy/widget/chatapp/group.dart';
import 'package:socket_io_client/socket_io_client.dart' as soc;

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});
  @override
  State<ChatApp> createState() {
    return _ChatApp();
  }
}

class _ChatApp extends State<ChatApp> {
  late soc.Socket socket;

  @override
  void initState() {
    super.initState();
    socketinit();
  }

  socketinit() {
    socket = soc.io('http://192.168.251.33:5000/api/v1/chat/send', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((data) {
      print(data);
      print('jai shree shyam');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
    socket.on('newmessage', (data) {
      print(data);
    });
  }

  void sendMessage() {
    String message = "this is websocket message";
    print(message);
    if (message.isEmpty) return;
    Map messageMap = {
      'message': message,
      'senderId': "userId",
      'receiverId': "receiverId",
      'time': DateTime.now().millisecondsSinceEpoch,
    };
    socket.emit('sendNewMessage', messageMap);
  }
  @override
  void dispose() {
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Group',
                icon: Icon(Icons.group),
              ),
              Tab(
                text: 'Friends',
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GroupChats(send: sendMessage,),
            const Center(
              child: Text('Friends'),
            ),
          ],
        ),
      ),
    );
  }
}
