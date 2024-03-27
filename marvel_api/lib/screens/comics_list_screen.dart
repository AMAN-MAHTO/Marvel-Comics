import 'package:flutter/material.dart';

import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class ComicsListScreen extends StatefulWidget {
  const ComicsListScreen({super.key});

  @override
  State<ComicsListScreen> createState() => _ComicsListScreenState();
}

class _ComicsListScreenState extends State<ComicsListScreen> {
  List<ResultComic> comic_result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchComics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Marvel characters"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/themeChanger');
          },
          child: Icon(Icons.settings),
        ),
        body: comic_result.length == 0
            ? LinearProgressIndicator()
            : ListView.builder(
                itemCount: comic_result.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Image.network(comic_result[index].thumbnail!.imgUrl()),
                    title: Text(comic_result[index].title!),
                    subtitle: Text(comic_result[index].prices.toString()),
                    onTap: () {},
                  );
                }));
  }

  Future<void> fetchComics() async {
    final response = await MarvelAPI.getComics();
    setState(() {
      comic_result = response;
    });
  }
}
