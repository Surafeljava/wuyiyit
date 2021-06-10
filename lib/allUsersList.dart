import 'package:flutter/material.dart';

class AllUsersList extends StatefulWidget {
  const AllUsersList({Key? key}) : super(key: key);

  @override
  _AllUsersListState createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Users List!'),
      ),
    );
  }
}
