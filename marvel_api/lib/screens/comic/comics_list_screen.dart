import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      body: dataProvider.comicsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: dataProvider.comicsList.length,
                    itemBuilder: (context, index) {
                      var comic = dataProvider.comicsList[index];
                      return SlideTransition(
                        position: _animation,
                        child: Card(
                            elevation: 4,
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/comic',
                                  arguments: comic.id.toString(),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.network(comic.thumbnail!.imgUrl()),
                                  ListTile(
                                    title: Text(
                                      comic.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
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
