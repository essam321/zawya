import 'package:flutter/material.dart';
import 'package:mind_games/presentation/drawer/drawer_list_view.dart';
import 'package:mind_games/presentation/resources/colors.dart';

AppColors _colors = AppColors();
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 250),
      child: Drawer(
        width: 300,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15))),
        backgroundColor: _colors.drawerColor,
        child: DrawerListView(),
      ),
    );
  }
}
