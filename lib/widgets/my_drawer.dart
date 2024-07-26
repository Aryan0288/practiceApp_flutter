import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/D4D03AQFnezFfliX3pg/profile-displayphoto-shrink_400_400/0/1702044523812?e=1726704000&v=beta&t=EpYAGq3izG0bETvyXwW5fGb910T6o71fy0ZGV-tMBDs";
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Aryan"),
                accountEmail: Text("aryan.nln@ppreciate.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              title: Text(
                "Home",
                textScaler: TextScaler.linear(1.2),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
              ),
              title: Text(
                "Profile",
                textScaler: TextScaler.linear(1.2),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.question_circle,
              ),
              title: Text(
                "Contact Us",
                textScaler: TextScaler.linear(1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
