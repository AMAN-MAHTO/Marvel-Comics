import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({Key? key}) : super(key: key);

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Set animation duration
    );
    _animation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start from below the screen
      end: Offset.zero, // End at the initial position
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Choose your desired curve
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.characterList.isEmpty) {
      dataProvider.updateCharacterList();
    }

    return Scaffold(
      body: dataProvider.characterList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: dataProvider.characterList.length,
                  itemBuilder: (context, index) {
                    var character = dataProvider.characterList[index];
                    return SlideTransition(
                      position: _animation,
                      child: Card(
                          elevation: 4,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/character',
                                arguments: character.id.toString(),
                              );
                            },
                            child: Column(
                              children: [
                                Image.network(character.thumbnail!.imgUrl()),
                                ListTile(
                                  title: Text(
                                    character.name!,
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),);}
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.forward(); // Start the animation when the screen is shown
  }
}
