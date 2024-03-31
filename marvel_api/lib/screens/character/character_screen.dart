import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_character.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatefulWidget {
  final String id;
  const CharacterScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  ResultCharacter? character;

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.characterList.isEmpty) {
      dataProvider.updateCharacterList();
    }
    character = dataProvider.characterList
        .firstWhere((element) => element.id.toString() == widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(character?.name ?? 'Character Details'),
      ),
      body: character == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Comics',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200, // Adjust the height of the horizontal list as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: character!.comics!.length,
                    itemBuilder: (context, index) {
                      var comic = character!.comics!.items![index];
                      return SizedBox(
                        width: 150, // Adjust the width of each item as needed
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Image.network(comic.thumbnail!.imgUrl()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(comic.name!),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
