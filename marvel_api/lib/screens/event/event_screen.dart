import 'package:flutter/material.dart';
import 'package:marvel_api/models/result_event.dart';
import 'package:marvel_api/provider/data_provider.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  final String id;
  const EventScreen({super.key, required this.id});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  ResultEvent? event;

  @override
  Widget build(BuildContext context) {
    print('build event widget');
    var dataProvider = Provider.of<DataProvider>(context);
    if (dataProvider.eventsList.length == 0) {
      dataProvider.updateEventsList();
    }
    event = dataProvider.eventsList
        .where((element) => element.id.toString() == widget.id)
        .toList()[0];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image and description section
            if (event != null && event!.thumbnail != null)
              Image.network(
                event!.thumbnail!.imgUrl(),
                fit: BoxFit.cover,
              ),
            Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  // if (event != null && event!.name != null)
                  Text(
                    event!.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(
                      height:
                          8), // Add some spacing between the name and the description
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer, // Light red shade
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event != null &&
                              event!.description != null &&
                              event!.description!.isNotEmpty
                          ? event!.description!
                          : "No Description Available",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height:
                    16), // Add some spacing between the description and the heading
            // Event list heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "EVENT LIST",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Event list
            if (dataProvider.eventsList != null)
              ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Disable scrolling of the list
                itemCount: dataProvider.eventsList.length,
                itemBuilder: (context, index) {
                  var currentEvent = dataProvider.eventsList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal:
                            8), // Adjust vertical and horizontal padding
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16), // Adjust content padding
                        title: Text(currentEvent.name ?? ""),
                        subtitle: Text(currentEvent.description ?? ""),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventScreen(
                                id: currentEvent.id.toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            SizedBox(height: 16), // Add some spacing after the event list
            // Comics list heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "COMICS LIST",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Comics list
            // Add your comics list widget here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
