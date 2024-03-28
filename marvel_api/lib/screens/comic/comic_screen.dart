import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';
import 'package:provider/provider.dart';

class ComicScreen extends StatefulWidget {
  final String id;
  const ComicScreen({super.key, required this.id});

  @override
  State<ComicScreen> createState() => _ComicScreenState();
}

class _ComicScreenState extends State<ComicScreen> {
  ResultComic? comic;

  @override
  Widget build(BuildContext context) {
    print('build comic widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.comicsList.length == 0) {
      dataProvider.updateComicsList();
    }
    comic = dataProvider.comicsList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(comic!.title!),
      ),
      body: comic == null
          ? LinearProgressIndicator()
          : Center(child: Text(comic?.description?? "")),
    );
  }
}
