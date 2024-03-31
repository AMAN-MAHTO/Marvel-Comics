import 'package:flutter/material.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen>
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
    if (dataProvider.eventsList.isEmpty) {
      dataProvider.updateEventsList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Events List'),
      ),
      body: dataProvider.eventsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SlideTransition(
  position: _animation,
  child: ListView.builder(
    itemCount: dataProvider.eventsList.length,
    itemBuilder: (context, index) {
      var event = dataProvider.eventsList[index];
      return SlideTransition(
        position: _animation,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Image.network(event.thumbnail!.imgUrl()),
              ListTile(
                title: Text(event.id.toString()), // Convert event id to string
                subtitle: Text(event.description ?? ''),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/event',
                    arguments: event.id.toString(),
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.forward(); // Start the animation when the screen is shown
  }
}
