import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_series.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:marvel_api/screens/comic/comic_screen.dart';
import 'package:provider/provider.dart';

class SeriesScreen extends StatefulWidget {
  final String id;
  const SeriesScreen({super.key, required this.id});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  ResultSeries? series;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.seriesList.length == 0) {
      dataProvider.updateSeriesList();
    }
    series = dataProvider.seriesList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  series!.thumbnail!.imgUrl(),
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        series!.title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(
                          height:
                              8), // Add some spacing between the name and the description
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer, // Light red shade
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          series!.description?.isNotEmpty ?? false
                              ? series!.description!
                              : "No Description Available",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height:
                        16), // Add some spacing between the description and the comic list
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
                if (series != null)
                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // Disable scrolling of the list
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
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Align the button to the bottom right corner
    );
  }
}
