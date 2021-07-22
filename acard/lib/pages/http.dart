import 'dart:async';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

class Album {
  final int userID;
  final int id;
  final String title;

  Album({
    required this.id,
    required this.title,
    required this.userID,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
      userID: json['userID'],
    );
  }
}
