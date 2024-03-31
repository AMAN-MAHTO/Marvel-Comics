import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class StoriesListScreen extends StatefulWidget {
  const StoriesListScreen({Key? key}) : super(key: key);

  @override
  _StoriesListScreenState createState() => _StoriesListScreenState();
}

class _StoriesListScreenState extends State<StoriesListScreen>
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
    if (dataProvider.storiesList.isEmpty) {
      dataProvider.updateStoriesList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("S T O R I E S"),
      ),
      body: dataProvider.storiesList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: dataProvider.storiesList.length,
                  itemBuilder: (context, index) {
                    var stories = dataProvider.storiesList[index];
                    return SlideTransition(
                      position: _animation,
                      child: Card(
                          elevation: 4,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/storie',
                                arguments: stories.id.toString(),
                              );
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    stories.title!,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
    _animationController
        .forward(); // Start the animation when the screen is shown
  }
}
