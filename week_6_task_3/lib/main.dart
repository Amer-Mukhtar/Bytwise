import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('notesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final TextEditingController _controller = TextEditingController();
  final Box<String> notesBox = Hive.box('notesBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Hive Storage App',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                  color: Colors.white),
              controller: _controller,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  labelText: 'Enter Note',labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16.0),
            Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ),
                onPressed: _addNote,
                child: const Text('Save Note',style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: notesBox.listenable(),
                builder: (context, Box<String> box, _) {
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text('No notes added.', style: TextStyle(color: Colors.white)),
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.only(top: 20, left: 10,right: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xFF211a23),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final key = box.keyAt(index) as int;
                        final value = box.get(key) as String;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical:5,horizontal: 12),
                          decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                          child: ListTile(
                            title: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.white),
                              onPressed: () => _deleteNote(key),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _addNote() {
    final note = _controller.text;
    if (note.isNotEmpty) {
      notesBox.add(note);
      _controller.clear();
    }
  }

  void _deleteNote(int key) {
    notesBox.delete(key);
  }
}
