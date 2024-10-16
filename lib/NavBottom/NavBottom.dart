import 'package:flutter/material.dart';
import 'package:odc_formation/pages/home/home.dart';
import 'package:odc_formation/pages/profile/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          // appBar: AppBar(
          //   title: const [
          //     Text("Home"),
          //     Text("Liste des formations"),
          //     Text("Profile")
          //   ][_currentIndex],
          // ),
          body:const [
            Home(),
            Profile(),
          ][_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,

            onTap: (index) => setCurrentIndex(index),

            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            iconSize: 32,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Acceuil'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'Acceuil'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Ajout'
              )
            ],
          ),
    );
  }
}
