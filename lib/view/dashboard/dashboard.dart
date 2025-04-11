import 'package:fixtures/core/colors.dart';
import 'package:fixtures/view/home/home_view.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeView(), Container(), Container(), Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        showUnselectedLabels: true,
        selectedItemColor: Pallet.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Pallet.black),
        unselectedIconTheme: IconThemeData(color: Colors.grey),

        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: Pallet.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: "Matches"),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_open_sharp),
            label: "History",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
      ),
    );
  }
}
