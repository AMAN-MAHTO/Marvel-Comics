import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/models/result_creator.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CreatorScreen extends StatefulWidget {
  final String id;
  const CreatorScreen({super.key, required this.id});

  @override
  State<CreatorScreen> createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  ResultCreator? creator;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.creatorList.length == 0) {
      dataProvider.updateCreatorList();
    }
    creator = dataProvider.creatorList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(creator!.id.toString()),
      ),
      body: creator == null
          ? LinearProgressIndicator()
          : Center(child: Text(creator!.startYear.toString())),
    );
  }
}
