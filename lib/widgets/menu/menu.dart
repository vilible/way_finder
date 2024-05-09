import "dart:io";

import 'package:flutter/material.dart';
import "package:way_finder/widgets/bars/windows_bar.dart";

import "package:way_finder/widgets/menu/tab_switch.dart";
import "package:way_finder/widgets/menu/tabs/settings.dart";
import "package:way_finder/widgets/menu/tabs/trajectory.dart";

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget _page = const Settings();
  int _selectedTab = 0;

  void _changePage(int index) {
    setState(() {
      _selectedTab = index;
      _page = switch (index) {
        0 => const Settings(),
        1 => const Trajectory(),
        _ => throw Exception("Unknown index: $index"),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: <Widget>[
          if (Platform.isWindows) const WindowsBar(buttonsEnabled: false),
          TabSwitch(selectedTab: _selectedTab, onChange: _changePage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: _page,
            ),
          ),
        ],
      ),
    );
  }
}
