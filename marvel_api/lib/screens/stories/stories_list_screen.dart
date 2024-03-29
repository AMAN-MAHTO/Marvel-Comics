import 'package:flutter/material.dart';
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
              child: ListView.builder(
                itemCount: dataProvider.storiesList.length,
                itemBuilder: (context, index) {
                  var story = dataProvider.storiesList[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(story.title!),
                      subtitle: Text(story.description!),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/storie',
                          arguments: story.id.toString(),
                        );
                      },
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
