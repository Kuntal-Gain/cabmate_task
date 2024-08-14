import 'package:cabmate_task/profile.dart';
import 'package:cabmate_task/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _HomepageState();
}

class _HomepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/img.png'),
              ),
              SizedBox(height: 20),
              Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text("Username"),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text("Password"),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>prof()));
                  },
                  child: Text("LOGIN", style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: "Don't have an account? ",style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'Sign up',style: TextStyle(color: Colors.blue,
                    decoration: TextDecoration.underline,),
                    recognizer: TapGestureRecognizer()..onTap=(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                    }
    ),
    ],
          ),
        ),
    ],
      ),
    ),
      ),
    );
  }
}
