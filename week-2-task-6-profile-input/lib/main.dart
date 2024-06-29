import 'package:flutter/material.dart';
import 'Screens/show_profile_screen.dart';
void main() {
  runApp(const UserInputNavigationApp());
}

class UserInputNavigationApp extends StatelessWidget {
  const UserInputNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Input and Navigation App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  String selectedGender = 'Male';
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('User Input and Navigation App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(child: Image.asset('images/profile.png'),),
              const SizedBox(height: 16),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Enter your name',labelStyle: const TextStyle(
                    color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                    focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5), // Border when focused
                )
                ),
              ),
              const SizedBox(height: 15),
              //Text('Gender:',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              Theme(
                data: ThemeData.dark(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      activeColor: Colors.white70,
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Male',style: TextStyle(color: Colors.white)),
                    Radio<String>(
                      activeColor: Colors.white70,
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Female',style: TextStyle(color: Colors.white)),
                    Radio<String>(
                      activeColor: Colors.white70,
                      value: 'Other',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    const Text('Other',style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 20,)
                  ],
                ),
              ),
              Theme(
                data: ThemeData.dark(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: Colors.white70,
                      value: agreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreedToTerms = value!;
                        });
                      },
                    ),
                    const Text('Agree to terms and conditions',
                        style: TextStyle(color: Colors.white,fontSize: 15,)
                    ),
                    const SizedBox(width: 20,)

                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        name: nameController.text,
                        gender: selectedGender,
                        agreedToTerms: agreedToTerms,
                      ),
                    ),
                  );
                },
                child: const Text('Submit',style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
