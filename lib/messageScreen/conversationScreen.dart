import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wuyiyit/providers/mainProvider.dart';

import '../wrapper.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 4,
              ),
              child: ListTile(
                title: Text('User Name'),
                subtitle: Text('message...'),
                leading: CircleAvatar(
                  child: Text('CJ'),
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                ),
                onTap: () {
                  // ignore: close_sinks
                  Socket socket =
                      Provider.of<MainProvider>(context, listen: false)
                          .sockets[0];

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Wrapper(socket: socket)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
