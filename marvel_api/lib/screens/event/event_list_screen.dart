import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build event list widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.eventsList.length == 0) {
      dataProvider.updateEventsList();
    }

    return Scaffold(
        body: Consumer<DataProvider>(builder: (context, value, child) {
      return value.eventsList.length == 0
          ? LinearProgressIndicator()
          : character_list(value);
    }));
  }

  ListView character_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.eventsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(value.eventsList[index].thumbnail!.imgUrl()),
            title: Text(value.eventsList[index].id.toString()),
            subtitle: Text(value.eventsList[index]!.description!),
            onTap: () {
              print(value.eventsList[index].id.toString());
              Navigator.pushNamed(context, '/event',
                  arguments: value.eventsList[index].id.toString());
            },
          );
        });
  }
}
