import 'package:http/http.dart' as http;
import 'package:mobile/configs/constant_url.dart';
import 'package:mobile/models/Tracks.dart';
import 'dart:convert';

Future<List> fetchTracks() async {
  List<dynamic> result = [];
  final response = await http.get(Uri.parse(ConstantURL.getTracksURL));

  if (response.statusCode == 200) {
    late List<Tracks> tracks;
    final json = jsonDecode(response.body);
    result = json['data'] as List<dynamic>;
    final transformed = result.map((item) {
      final artist = Artist(
          id: item["album"]["artist"]["id"],
          name: item["album"]["artist"]["name"],
          images: item["album"]["artist"]["imgaes"],
          followers: item["album"]["artist"]["followers"],
          popularity: item["album"]["artist"]["popularity"],
          status: item["album"]["artist"]["status"],
          userId: item["album"]["artist"]["user_id"],
          createdAt: item["album"]["artist"]["created_at"],
          updatedAt: item["album"]["artist"]["updated_at"]);
      final album = Album(
          id: item["album"]["id"],
          name: item["album"]["name"],
          images: item["album"]["images"],
          followers: item["album"]["followers"],
          popularity: item["album"]["popularity"],
          type: item["album"]["type"],
          totalTracks: item["album"]["totalTracks"],
          releaseDate: item["album"]["releaseDate"],
          status: item["album"]["status"],
          artistId: item["album"]["artistId"],
          createdAt: item["album"]["createdAt"],
          updatedAt: item["album"]["updatedAt"],
          artist: artist);

      return Tracks(
          id: item["id"],
          name: item["name"],
          images: item["images"],
          durationMs: item["durationMs"],
          popularity: item["popularity"],
          releaseDate: item["releaseDate"],
          mp3: item["mp3"],
          status: item["status"],
          albumId: item["albumId"],
          createdAt: item["createdAt"],
          updatedAt: item["updatedAt"],
          album: album);
    }).toList();
    tracks = transformed;
    return result;
  } else {
    throw Exception('Failed to load data');
  }
}

Album albumGenerate(album) {
  return Album(
      id: album["id"],
      name: album["name"],
      images: album["images"],
      followers: album["followers"],
      popularity: album["popularity"],
      type: album["type"],
      totalTracks: album["totalTracks"],
      releaseDate: album["releaseDate"],
      status: album["status"],
      artistId: album["artistId"],
      createdAt: album["createdAt"],
      updatedAt: album["updatedAt"],
      artist: artistGenerate(album["artist"]));
}

Artist artistGenerate(artist) {
  return Artist(
      id: artist["id"],
      name: artist["name"],
      images: artist["images"],
      followers: artist["followers"],
      popularity: artist["popularity"],
      status: artist["status"],
      userId: artist["userId"],
      createdAt: artist["createdAt"],
      updatedAt: artist["updatedAt"]);
}
