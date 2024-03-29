import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class CreatorListScreen extends StatefulWidget {
  const CreatorListScreen({Key? key}) : super(key: key);

  @override
  State<CreatorListScreen> createState() => _CreatorListScreenState();
}

class _CreatorListScreenState extends State<CreatorListScreen>
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
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.creatorList.isEmpty) {
      dataProvider.updateCreatorList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("C R E A T O R S"),
      ),
      body: dataProvider.creatorList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
              position: _animation,
              child: ListView.builder(
                itemCount: dataProvider.creatorList.length,
                itemBuilder: (context, index) {
                  var creator = dataProvider.creatorList[index];
                  return ListTile(
                    leading: Image.network(creator.thumbnail!.imgUrl()),
                    title: Text(creator.title ??
                        creator.id.toString()),
                    subtitle: Text(creator.description ??
                        creator.startYear.toString()),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/creator',
                        arguments: creator.id.toString(),
                      );
                    },
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
