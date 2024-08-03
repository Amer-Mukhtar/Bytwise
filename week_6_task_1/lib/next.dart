import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '4358036c02f147b7b342c568e9df989b';
  final String baseUrl = 'https://newsapi.org/v2/everything';

  Future<List<dynamic>> fetchFlutterNews() async {
    final url = Uri.parse('$baseUrl?q=flutter&apiKey=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['articles']; // List of articles
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
