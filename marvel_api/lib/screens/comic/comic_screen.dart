import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_comic.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class ComicScreen extends StatefulWidget {
  final String id;
  const ComicScreen({Key? key, required this.id});

  @override
  State<ComicScreen> createState() => _ComicScreenState();
}

class _ComicScreenState extends State<ComicScreen> {
  ResultComic? comic;

  @override
  Widget build(BuildContext context) {
    print('build comic widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.comicsList.isEmpty) {
      dataProvider.updateComicsList();
    }
    comic = dataProvider.comicsList
        .firstWhere((element) => element.id.toString() == widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(comic?.title ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Image.network(
                    comic?.thumbnail?.imgUrl() ?? '', 
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: comic == null
                ? LinearProgressIndicator()
                : ListView.builder(
                    itemCount: dataProvider.comicsList.length,
                    itemBuilder: (context, index) {
                      var currentComic = dataProvider.comicsList[index];
                      return ListTile(
                        title: Text(currentComic.title !),
                        subtitle: Text(currentComic.description !),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComicScreen(
                                id: currentComic.id.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
