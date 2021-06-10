import 'package:flutter/material.dart';

class AllUsersList extends StatefulWidget {
  const AllUsersList({Key? key}) : super(key: key);

  @override
  _AllUsersListState createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            'Add To Chat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Online Users',
            style: TextStyle(
              color: Colors.green[400],
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 4,
              ),
              child: ListTile(
                title: Text('User Name'),
                subtitle: Text('tap to chat...'),
                leading: CircleAvatar(
                  child: Text('SK'),
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
