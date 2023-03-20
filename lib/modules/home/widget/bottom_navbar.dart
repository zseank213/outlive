import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_svg/svg.dart';

Widget BottomNavBar({
  required int selectedIndex,
  required void Function(int) onItemTapped,
}) {
  return BottomNavigationBar(
    currentIndex: selectedIndex,
    backgroundColor: Colors.white,
    elevation: 10,
    selectedItemColor: primary,
    onTap: onItemTapped,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.grey,
    selectedFontSize: 12,
    selectedLabelStyle: const TextStyle(color: primary),
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/icons/Home.svg",
          color: neutral80,
        ),
        label: 'Home',
        tooltip: '',
        activeIcon: SvgPicture.asset(
          "assets/images/icons/Home.svg",
          color: primary,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/icons/Explore.svg",
          color: neutral80,
        ),
        label: 'Explore',
        tooltip: '',
        activeIcon: SvgPicture.asset(
          "assets/images/icons/Explore Active.svg",
          color: primary,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/icons/Rencana.svg",
          color: neutral80,
        ),
        label: 'Rencana',
        tooltip: '',
        activeIcon: SvgPicture.asset(
          "assets/images/icons/Rencana.svg",
          color: primary,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/icons/Account.svg",
          color: neutral80,
        ),
        label: 'Akun',
        tooltip: '',
        activeIcon: SvgPicture.asset(
          "assets/images/icons/Account.svg",
          color: primary,
        ),
      ),
    ],
  );
}
