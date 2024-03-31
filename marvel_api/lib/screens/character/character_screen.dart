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
  body: Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              character!.thumbnail!.imgUrl(),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    character!.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8), // Add some spacing between the name and the description
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red[100], // Light red shade
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      character!.description?.isNotEmpty ?? false
                          ? character!.description!
                          : "No Description Available",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Add some spacing between the description and the comic list
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "COMIC LIST",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Comic list
            if (character != null)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable scrolling of the list
                itemCount: dataProvider.comicsList.length,
                itemBuilder: (context, index) {
                  var currentComic = dataProvider.comicsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(currentComic.title!),
                        subtitle: Text(currentComic.description ?? ""),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterScreen(
                                id: currentComic.id.toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    ],
  ),
  floatingActionButton: Padding(
    padding: const EdgeInsets.all(16.0), // Add some padding
    child: FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back),
    ),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Align the button to the bottom right corner
);


  }
}
