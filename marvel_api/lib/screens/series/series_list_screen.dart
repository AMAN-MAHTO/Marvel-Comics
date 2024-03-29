import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class SeriesListScreen extends StatefulWidget {
  const SeriesListScreen({super.key});

  @override
  State<SeriesListScreen> createState() => _SeriesListScreenState();
}

class _SeriesListScreenState extends State<SeriesListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build character widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.seriesList.length == 0) {
      dataProvider.updateSeriesList();
    }

    return Scaffold(
        appBar: AppBar(title: Text("S E R I E S")),
        body: Consumer<DataProvider>(builder: (context, value, child) {
          return value.seriesList.length == 0
              ? LinearProgressIndicator()
              : series_list(value);
        }));
  }

  ListView series_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.seriesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(value.seriesList[index].thumbnail!.imgUrl()),
            title: Text(value.seriesList[index].title!),
            subtitle: Text(value.seriesList[index].startYear!.toString()),
            onTap: () {
              print(value.seriesList[index].id.toString());
              Navigator.pushNamed(context, '/series',
                  arguments: value.seriesList[index].id.toString());
            },
          );
        });
  }
}
