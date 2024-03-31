import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_series.dart';
import 'package:marvel_api/provider/data_provider.dart';
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
  appBar: AppBar(
    title: Text(series?.title ?? 'Series Title'),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ),
  body: series == null
      ? LinearProgressIndicator()
      : Center(child: Text(series!.rating ?? 'Rating not available')),
);


  }
}
