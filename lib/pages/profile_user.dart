import 'package:cleaningservice/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  String? email;
  String? token;

  void userLog() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    email = preferences.getString('token');
    token = preferences.getString('token');
    setState(() {});
  }

  @override
  void initState() {
    userLog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return Login();
    } else {
      return SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(color: Colors.green, height: 300),
                Positioned(
                  bottom: 50,
                  child: Text(
                    name != null ? name! : '',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    }
  }
}
