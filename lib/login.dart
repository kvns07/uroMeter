import 'package:flutter/material.dart';
import 'package:urometer/nameSearch.dart';
// import 'package:flutter_svg/flutter_svg.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/cover.png', // Ensure you have this image in the assets folder
                height: 150,
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement login logic

                  String email = _emailController.text;
                  String password = _passwordController.text;
                  // if(email=="test1@gmail.com"&&password=="test1") {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NameSearchPage()),);
                  // }
                  print('Email: $email, Password: $password');
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
