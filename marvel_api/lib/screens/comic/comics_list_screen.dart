import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
                    :SlideTransition(
  position: _animation,
  child: MasonryGridView.builder(
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemCount: dataProvider.comicsList.length,
    itemBuilder: (context, index) {
      // Check if the index is within the bounds of the comics list
      if (index < dataProvider.comicsList.length) {
        var comic = dataProvider.comicsList[index];
        return SlideTransition(
          position: _animation,
          child: Card(
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/character',
                  arguments: comic.id.toString(),
                );
              },
              child: Column(
                children: [
                  Image.network(comic.thumbnail!.imgUrl()),
                  ListTile(
                    title: Text(
                      comic.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        // If the index is out of range, return an empty container
        return Container();
      }
    },
  ),
),);}
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
