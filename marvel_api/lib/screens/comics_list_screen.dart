import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';

import 'package:provider/provider.dart';

class ComicsListScreen extends StatefulWidget {
  const ComicsListScreen({super.key});

  @override
  State<ComicsListScreen> createState() => _ComicsListScreenState();
}

class _ComicsListScreenState extends State<ComicsListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build comic widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.comicsList.length == 0) {
      dataProvider.updateComicsList();
    }
    return Scaffold(
        body: Consumer<DataProvider>(builder: (context, value, child) {
      return dataProvider.comicsList.length == 0
          ? LinearProgressIndicator()
          : comic_list(value);
    }));
  }

  ListView comic_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.comicsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(value.comicsList[index].thumbnail!.imgUrl()),
            title: Text(value.comicsList[index].title!),
            subtitle: Text(value.comicsList[index].prices.toString()),
            onTap: () {
              Navigator.pushNamed(context, '/comic',
                  arguments: value.comicsList[index].id.toString());
            },
          );
        });
  }
}
