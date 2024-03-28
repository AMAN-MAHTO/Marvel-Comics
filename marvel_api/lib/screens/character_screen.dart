import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class CharacterScreen extends StatefulWidget {
  final String id;
  const CharacterScreen({super.key, required this.id});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  ResultCharacter? character;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final id = ModalRoute.of(context)!.settings.arguments as String;

    getCharacter(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M A R V E L"),
      ),
      body: character == null
          ? LinearProgressIndicator()
          : Center(child: Text(character!.name)),
    );
  }

  void getCharacter(String id) async {
    var response = await MarvelAPI.getCharacterById(id);
    if (mounted) {
      setState(() {
        character = response;
      });
    }
  }
}
