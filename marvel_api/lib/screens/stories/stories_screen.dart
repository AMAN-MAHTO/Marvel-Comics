import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_storie.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class StorieScreen extends StatefulWidget {
  final String id;
  const StorieScreen({super.key, required this.id});

  @override
  State<StorieScreen> createState() => _StorieScreenState();
}

class _StorieScreenState extends State<StorieScreen> {
  ResultStorie? storie;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.storiesList.length == 0) {
      dataProvider.updateStoriesList();
    }
    storie = dataProvider.storiesList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(storie!.title!),
      ),
      body: storie == null
          ? LinearProgressIndicator()
          : Center(child: Text(storie!.description!)),
    );
  }
}
