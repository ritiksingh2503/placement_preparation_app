import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class Youtube extends StatefulWidget {
  const Youtube({required this.url, required this.title});

  final String title, url;
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  Future<List> getData() async {
    final response = await http
        .get(Uri.parse("https://placement-preparation1.herokuapp.com/"));
    return jsonDecode(response.body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Videos"),
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            // if(snapshot.hasError)print(snapshot.error);
            // ?ListVideo(list: snapshot.data)
            // :CircularProgressIndicator();
            // return  Text("${snapshot.error}");
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              return ListVideo(list: snapshot.data!.toList());
            } else
              return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => VideoPlayer(
                            url:
                                "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}")),
                  ),
                  child: Container(
                    height: 210.0,
                    // child: Image.network( list[i]['snippet']['thumbnails']['high']['url']),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                          image: NetworkImage(

                              list[i]['snippet']['thumbnails']['high']['url']),
                          ),
                    ),
                  ),
                ),
                Text(
                  list[i]['snippet']['title'],
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: "lato",
                  ),
                )
              ],
            ),
          );
        });
  }
}

class VideoPlayer extends StatelessWidget {
  final String url;
  VideoPlayer({required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(
        url: url,
        appBar: AppBar(
          shadowColor: Colors.black45,
          title: Text("Video"),
        ),
      ),
    );
  }
}
