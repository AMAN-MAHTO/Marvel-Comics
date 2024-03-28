import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatefulWidget {
  final String id;
  const CharacterScreen({super.key, required this.id});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  ResultCharacter? character;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.characterList.length == 0) {
      dataProvider.updateCharacterList();
    }
    character = dataProvider.characterList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(character!.name!),
      ),
      body: character == null
          ? LinearProgressIndicator()
          : Center(child: Text(character!.name!)),
    );
  }
}
