import 'package:flutter/material.dart';
import 'second.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonActive = false;
  Color _buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Advanced User Input App',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            setState(() {
              _isButtonActive = _formKey.currentState!.validate();
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 40,),
              TextFormField(
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(labelText: 'Name',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTapDown: (details) {
                  if (_isButtonActive) {
                    setState(() {
                      _buttonColor = Colors.yellow;
                    });
                  }
                },
                onTapUp: (details) {
                  if (_isButtonActive) {
                    setState(() {
                      _buttonColor = Colors.green;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: _isButtonActive ? _buttonColor : Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
