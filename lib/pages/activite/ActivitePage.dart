import 'package:flutter/material.dart';

class ActivityListScreen extends StatefulWidget {
  const ActivityListScreen({super.key});

  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {

  final List<Map<String, dynamic>> activities = [
    {'name': 'OFAB', 'participants': 30, 'image': 'assets/ofab.png'},
    {'name': 'ODK', 'participants': 4600, 'image': 'assets/odk.png'},
    {'name': 'FABLAB', 'participants': 4600, 'image': 'assets/fablab.png'},
    {'name': 'OMultimedia', 'participants': 4600, 'image': 'assets/omultimedia.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0), // Ajoute du padding en bas
      //     child: TextField(
      //       decoration: InputDecoration(
      //         hintText: 'Recherche une formation',
      //         filled: true,
      //         fillColor: Colors.grey[200],
      //         prefixIcon: Icon(Icons.search, color: Colors.orange),
      //         border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(30),
      //           borderSide: BorderSide.none,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0,top: 10,), // Ajoute du padding en bas
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche une formation',
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Text(
            'Liste des activités en cours',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return ActivityCard(activity: activities[index]);
            },
          ),
        ],
      ),
      //Bottom nav
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Map<String, dynamic> activity;

  const ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Remplacer par vos images d'assets
            Image.asset(activity['image'], height: 80),
            SizedBox(height: 16),
            Text(
              activity['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${activity['participants']} participants',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}