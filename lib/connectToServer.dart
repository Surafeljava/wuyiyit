import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wuyiyit/homeScreen/homeScreen.dart';
import 'package:wuyiyit/providers/mainProvider.dart';
import 'package:wuyiyit/wrapper.dart';

class ConnectToServer extends StatefulWidget {
  const ConnectToServer({Key? key}) : super(key: key);

  @override
  _ConnectToServerState createState() => _ConnectToServerState();
}

class _ConnectToServerState extends State<ConnectToServer> {
  TextEditingController ipAddressController = new TextEditingController();
  TextEditingController portController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Connect to a server'),
              SizedBox(
                height: 20.0,
              ),
              addressTextFieldGenerator(
                  controller: ipAddressController, hint: 'IP Address'),
              SizedBox(
                height: 15.0,
              ),
              addressTextFieldGenerator(
                  controller: portController, hint: 'Port Number'),
              SizedBox(
                height: 25.0,
              ),
              TextButton(
                child: Text('Connect'),
                onPressed: onConnectClicked,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onConnectClicked() async {
    //Connect to the server
    print("Connecting...");
    // ignore: close_sinks
    Socket socket = await Socket.connect('10.6.206.50', 4567);
    print("Done: ");
    Provider.of<MainProvider>(context, listen: false).addSocket(socket);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (_) => Wrapper(socket: socket)));
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  Widget addressTextFieldGenerator(
      {required TextEditingController controller, required String hint}) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      keyboardType: TextInputType.number,
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
