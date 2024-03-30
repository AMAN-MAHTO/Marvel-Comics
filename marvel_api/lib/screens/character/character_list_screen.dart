import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Text('Characters List'),
      ),
      body: dataProvider.characterList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: ListView.builder(
                itemCount: dataProvider.characterList.length,
                itemBuilder: (context, index) {
                  var character = dataProvider.characterList[index];
                  return SlideTransition(
                    position: _animation,
                    child: Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.transparent, // Transparent color for the card
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 17, 0),
                              Color.fromARGB(199, 211, 7, 7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.network(character.thumbnail!.imgUrl()),
                          title: Text(
                            character.name ?? '',
                            style: TextStyle(
                              color: Colors.white, // Change text color to white
                              fontWeight: FontWeight.bold, // Optional: Adjust font weight
                            ),
                          ),
                          subtitle: Text(
                            character.description ?? '',
                            style: TextStyle(
                              color: Colors.white70, // Change text color to a lighter shade of white
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/character',
                              arguments: character.id.toString(),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

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
