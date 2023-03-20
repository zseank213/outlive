import 'package:Eiger/lib.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List body = [
    const HomeTab(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 2,
                color: selectedIndex == 0 ? primary : Colors.transparent,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 2,
                color: selectedIndex == 1 ? primary : Colors.transparent,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 2,
                color: selectedIndex == 2 ? primary : Colors.transparent,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 2,
                color: selectedIndex == 3 ? primary : Colors.transparent,
              ),
            ],
          ),
          BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
