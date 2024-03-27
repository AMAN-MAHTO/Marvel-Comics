import 'package:flutter/material.dart';

import 'package:marvel_api/models/character.dart';
import 'package:marvel_api/services/marvel_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> character_result = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Rest API call"),
        ),
        body: ListView.builder(
            itemCount: character_result.length,
            itemBuilder: (context, index) {
              final character = character_result[index];
              return ListTile(
                leading: Image.network(character.thumbnail.imgUrl()),
                title: Text(character.name),
                subtitle: Text(character.description),
              );
            }));
  }

  Future<void> fetchCharacters() async {
    final response = await MarvelAPI.fetchCharacters();
    setState(() {
      character_result = response;
    });
  }
}
