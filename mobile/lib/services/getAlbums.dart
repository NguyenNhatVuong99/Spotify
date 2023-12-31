import 'package:http/http.dart' as http;
import 'package:mobile/models/Tracks.dart';
import 'dart:convert';

Future<List> fetchAlbums() async {
  List<dynamic> result = [];
  final response =
      await http.get(Uri.parse('https://spotify-xemk.onrender.com/api/albums'));

  if (response.statusCode == 200) {
    late List<Album> albums;
    final json = jsonDecode(response.body);
    result = json['data'] as List<dynamic>;
    return result;
  } else {
    throw Exception('Failed to load data');
  }
}
