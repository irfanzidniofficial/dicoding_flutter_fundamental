import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_http_request/data/models/album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
