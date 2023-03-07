import 'package:flutter/material.dart';
import 'package:tether/authentication/login_screen.dart';
import 'package:tether/authentication/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          flexibleSpace: Container(
            color: const Color(0xff26A17B),
          ),
          toolbarHeight: 5,

          automaticallyImplyLeading: false,

          bottom:  const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.white,),
                text: 'Login',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white,),
                text: 'Register',
              ),
            ] ,
            indicatorColor: Colors.white,
            indicatorWeight: 6,
          ),
        ),
        body: const TabBarView(
          children: [
            LoginScreen(),
            RegisterScreen()
          ],
        ),

      ),
    );
  }
}
