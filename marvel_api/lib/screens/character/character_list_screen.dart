import 'package:flutter/material.dart';

import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    print('build character widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.characterList.length == 0) {
      dataProvider.updateCharacterList();
    }

    return Scaffold(
        body: Consumer<DataProvider>(builder: (context, value, child) {
      return value.characterList.length == 0
          ? LinearProgressIndicator()
          : character_list(value);
    }));
  }

  ListView character_list(DataProvider value) {
    return ListView.builder(
        itemCount: value.characterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Image.network(value.characterList[index].thumbnail!.imgUrl()),
            title: Text(value.characterList[index].name!),
            subtitle: Text(value.characterList[index].description!),
            onTap: () {
              print(value.characterList[index].id.toString());
              Navigator.pushNamed(context, '/character',
                  arguments: value.characterList[index].id.toString());
            },
          );
        });
  }
}
