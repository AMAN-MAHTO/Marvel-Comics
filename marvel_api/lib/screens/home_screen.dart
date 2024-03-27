import 'package:flutter/material.dart';

import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/services/marvel_api_impl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        appBar: AppBar(
          title: const Text("Marvel Comics"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/themeChanger');
          },
          child: Icon(Icons.settings),
        ),
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
                    onTap: () {},
                  );
                }));
  }

  Future<void> fetchCharacters() async {
    final response = await MarvelAPI.getCharacters();
    setState(() {
      character_result = response;
    });
  }
}
