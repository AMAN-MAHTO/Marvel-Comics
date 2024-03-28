import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  final String id;
  const EventScreen({super.key, required this.id});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  ResultEvent? event;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.eventsList.length == 0) {
      dataProvider.updateEventsList();
    }
    event = dataProvider.eventsList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(event!.id.toString()),
      ),
      body: event == null
          ? LinearProgressIndicator()
          : Center(child: Text(event!.description!)),
    );
  }
}
