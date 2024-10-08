import 'package:cabmate_task/screens/profile/profile.dart';
import 'package:cabmate_task/screens/ride/publish_ride.dart';
import 'package:cabmate_task/screens/ride/trip_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Center(child: Text('Search')),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const TripScreen()));
                  },
                  child: const Text('Show Trip'))),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const PublishRideScreen()));
                  },
                  child: const Text('Create Ride'))),
        ],
      ),
      const Center(child: Text('Messages')),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[selectedIdx],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            selectedIdx = val;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: selectedIdx == 0 ? Colors.blue : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: selectedIdx == 1 ? Colors.blue : Colors.grey,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: selectedIdx == 2 ? Colors.blue : Colors.grey,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIdx == 3 ? Colors.blue : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
