import 'package:flutter/material.dart';
import 'next.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _newsService = NewsService();
  Future<List<dynamic>>? _articles;

  @override
  void initState() {
    super.initState();
    _articles = _newsService.fetchFlutterNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('News',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontStyle: FontStyle.italic,fontSize: 40),)),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError)
          {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty)
          {
            return Center(child: Text('No news '));
          }
          else
          {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  title: Text(article['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                  subtitle: Text(article['description'] ?? 'No description available',style: TextStyle(color: Colors.white),),
                );
              },
            );
          }
        },
      ),
    );
  }
}
