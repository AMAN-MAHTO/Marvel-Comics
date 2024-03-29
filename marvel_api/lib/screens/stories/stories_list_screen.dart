import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class StoriesListScreen extends StatefulWidget {
  const StoriesListScreen({super.key});

  @override
  State<StoriesListScreen> createState() => _StoriesListScreenState();
}

class _StoriesListScreenState extends State<StoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build stories list widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.storiesList.length == 0) {
      dataProvider.updateStoriesList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("S T O R I E S"),
        ),
        body: Consumer<DataProvider>(builder: (context, value, child) {
          return value.storiesList.length == 0
              ? LinearProgressIndicator()
              : stories_list(value);
        }));
  }

  ListView stories_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.storiesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(value.storiesList[index].title!),
            subtitle: Text(value.storiesList[index].description!),
            onTap: () {
              print(value.storiesList[index].id.toString());
              Navigator.pushNamed(context, '/storie',
                  arguments: value.storiesList[index].id.toString());
            },
          );
        });
  }
}
