import 'package:http/http.dart' as http;
import 'package:mobile/configs/constant_url.dart';
import 'package:mobile/models/Tracks.dart';
import 'dart:convert';

Future<List> fetchArtists() async {
  List<dynamic> result = [];
  final response = await http.get(Uri.parse(ConstantURL.artistsURL));

  if (response.statusCode == 200) {
    // ignore: unused_local_variable
    late List<Album> artists;
    final json = jsonDecode(response.body);
    result = json['data'] as List<dynamic>;
    return result;
  } else {
    throw Exception('Failed to load data');
  }
}
