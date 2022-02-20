import 'package:email_cleaner/core/init/design/color.dart';
import 'package:email_cleaner/feature/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:kartal/kartal.dart';

class TabsView extends StatefulWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedItemIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const Text(
      'Settings Page',
    ),
    const Text(
      'Heaty Page',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedItemIndex),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navbarItem(EvaIcons.folder, 0),
            navbarItem(EvaIcons.settings, 1),
            navbarItem(EvaIcons.activity, 2),
          ],
        ));
  }

  Widget navbarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 40,
        width: context.dynamicWidth(0.3),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? kcRoyalBlue : kcJuniper,
        ),
        decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: index == _selectedItemIndex ? kcHawkesBlue : kcWhite),
      ),
    );
  }
}
