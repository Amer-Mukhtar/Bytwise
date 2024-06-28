import 'package:flutter/material.dart';
Color text = Colors.black;

void main() {
  runApp(MyApp());
}

class Profile {
  final String name;
  final String title;
  final String description;
  final List<String> skills;
  final List<String> projects;

  Profile({
    required this.name,
    required this.title,
    required this.description,
    required this.skills,
    required this.projects,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final Profile myProfile = Profile(
    name: 'Amer Mukhtar',
    title: 'Bytwise Flutter Fellow',
    description: 'Computer science undergrad with a passion for innovation, problem-solving, and integrating tech into everyday '
        'life.',
    skills: ['Flutter', 'Dart', 'Firebase', 'HTML', 'CSS'],
    projects: ['Chat App - Whisper', 'BMI Calculator', 'Dice Game'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold, color: text),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(150, 75),bottomRight: Radius.elliptical(150, 75))),
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('images/profile_image.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        myProfile.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 6),
                      Text(
                        myProfile.title,
                        style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              ),
              ProfileCard(profile: myProfile),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.description, style: TextStyle(color: text)),
            SizedBox(height: 10),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: text),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: profile.skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(profile.skills[index], style: TextStyle(color: text)),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: text),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: profile.projects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(profile.projects[index], style: TextStyle(color: text)),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
