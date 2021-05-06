import 'package:flutter/material.dart';
import 'package:testss/widgets/drawer.dart';

class RecentScreen extends StatelessWidget {
  static const routeName = '/recent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recents'),),
      drawer: MyDrawer(whatIsSelected: 'recents'),
    );
  }
}
