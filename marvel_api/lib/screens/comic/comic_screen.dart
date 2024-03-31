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

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  comic!.thumbnail!.imgUrl(),
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    comic!.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        16), // Add some spacing between the text and the list
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "COMIC LIST",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Comic list
                if (comic != null)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataProvider.comicsList.length,
                    itemBuilder: (context, index) {
                      var currentComic = dataProvider.comicsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(currentComic.title!),
                            subtitle: Text(currentComic.description ?? ""),
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
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16, // Adjust bottom margin as needed
          right: 16, // Adjust right margin as needed
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ],
    );
  }
}
