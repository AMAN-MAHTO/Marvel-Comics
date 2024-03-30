import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class ComicsListScreen extends StatefulWidget {
  const ComicsListScreen({Key? key}) : super(key: key);

  @override
  State<ComicsListScreen> createState() => _ComicsListScreenState();
}

class _ComicsListScreenState extends State<ComicsListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust animation duration
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
    _animationController.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    print('build comic list widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.comicsList.isEmpty) {
      dataProvider.updateComicsList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Comics List'),
      ),
      
      body: dataProvider.comicsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: ListView.builder(
                itemCount: dataProvider.comicsList.length,
                itemBuilder: (context, index) {
                  var comic = dataProvider.comicsList[index];
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
                          leading: Image.network(comic.thumbnail!.imgUrl()),
                          title: Text(
                            comic.title ?? '',
                            style: TextStyle(
                              color: Colors.white, // Change text color to white
                              fontWeight: FontWeight.bold, // Optional: Adjust font weight
                            ),
                          ),
                          subtitle: Text(
                            comic.prices.toString(),
                            style: TextStyle(
                              color: Colors.white70, // Change text color to a lighter shade of white
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/comic',
                              arguments: comic.id.toString(),
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
}
