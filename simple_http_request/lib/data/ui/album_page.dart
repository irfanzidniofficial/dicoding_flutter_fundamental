import 'package:flutter/material.dart';
import 'package:simple_http_request/data/datasource/fetch_album.dart';
import 'package:simple_http_request/data/models/album.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    _futureAlbum = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album Page"),
      ),
      body: Center(
        child: FutureBuilder(
            future: _futureAlbum,
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  return const Text("No Daata");
                }
              }
            }),
      ),
    );
  }
}
