import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CreatorListScreen extends StatefulWidget {
  const CreatorListScreen({super.key});

  @override
  State<CreatorListScreen> createState() => _CreatorListScreenState();
}

class _CreatorListScreenState extends State<CreatorListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build character widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.creatorList.length == 0) {
      dataProvider.updateCreatorList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("C R E A T O R S"),
        ),
        body: Consumer<DataProvider>(builder: (context, value, child) {
          return value.creatorList.length == 0
              ? LinearProgressIndicator()
              : creator_list(value);
        }));
  }

  ListView creator_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.creatorList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Image.network(value.creatorList[index].thumbnail!.imgUrl()),
            title: Text(value.creatorList[index].title ??
                value.creatorList[index].id.toString()),
            subtitle: Text(value.creatorList[index].description ??
                value.creatorList[index].startYear.toString()),
            onTap: () {
              print(value.creatorList[index].id.toString());
              Navigator.pushNamed(context, '/creator',
                  arguments: value.creatorList[index].id.toString());
            },
          );
        });
  }
}
