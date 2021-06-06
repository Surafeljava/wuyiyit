import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final Socket socket;
  const Wrapper({Key? key, required this.socket}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  TextEditingController messageController = new TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // listen for responses from the server
    widget.socket.listen(
      // handle data from the server
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        setState(() {
          messages.add(serverResponse);
        });
      },

      // handle errors
      onError: (error) {
        print(error);
        widget.socket.destroy();
      },

      // handle server ending connection
      onDone: () {
        print('Server left.');
        widget.socket.destroy();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: messages.length == 0
                  ? Center(
                      child: Text('Wuyiyit Chats'),
                    )
                  : ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(messages[messages.length - index - 1]),
                          subtitle: Text('7:20 AM'),
                          leading: Icon(
                            Icons.account_circle,
                            color: Colors.amber[800],
                          ),
                        );
                      },
                    ),
            ),
            Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: messageTextFieldGenerator(
                        controller: messageController, hint: 'Message'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.amber[700],
                    ),
                    onPressed: () {
                      if (messageController.text.isEmpty) {
                        //show snackbar or make the button not active
                      } else {
                        FocusScope.of(context).unfocus();
                        sendMessage(message: messageController.text);
                        messageController.text = "";
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage({required String message}) async {
    widget.socket.write(message);
    await Future.delayed(Duration(seconds: 1));
  }

  void getMyChats() async {}

  Widget messageTextFieldGenerator(
      {required TextEditingController controller, required String hint}) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.blueGrey[700],
        letterSpacing: 1.0,
      ),
      onChanged: (phone) {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
            color: Colors.grey[600],
            letterSpacing: 0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent, width: 1.5),
        ),
      ),
    );
  }
}
