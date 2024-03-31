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
    itemCount: dataProvider.eventsList.length,
    itemBuilder: (context, index) {
      var comic= dataProvider.comicsList[index];
      return SlideTransition(
        position: _animation,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Image.network(comic.thumbnail!.imgUrl()),
              ListTile(
                title: Text(comic.title.toString()), // Convert event id to string
                subtitle: Text(comic.description ?? ''),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/event',
                    arguments: comic.id.toString(),
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  ),
),);}
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
