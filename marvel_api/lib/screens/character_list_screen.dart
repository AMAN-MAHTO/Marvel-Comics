import 'package:flutter/material.dart';

import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<ResultCharacter> character_result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: character_result.length == 0
            ? LinearProgressIndicator()
            : ListView.builder(
                itemCount: character_result.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                        character_result[index].thumbnail.imgUrl()),
                    title: Text(character_result[index].name),
                    subtitle: Text(character_result[index].description),
                    onTap: () {
                      print(character_result[index].id.toString());
                      Navigator.pushNamed(context, '/character',
                          arguments: character_result[index].id.toString());
                    },
                  );
                }));
  }

  Future<void> fetchCharacters() async {
    final response = await MarvelAPI.getCharacters();
    if (mounted) {
      setState(() {
        character_result = response;
      });
    }
  }
}
