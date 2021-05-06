import 'package:flutter/material.dart';
import 'package:testss/screens/calculator_screen.dart';
import 'package:testss/screens/geometry_screen.dart';
import 'package:testss/screens/recent_screen.dart';
import 'package:testss/screens/unit_converter_screen.dart';

class MyDrawer extends StatelessWidget {
  final String whatIsSelected;

  const MyDrawer({Key key, @required this.whatIsSelected}) : super(key: key);
  addItem({BuildContext context, String name, IconData icon, String route, bool isSelected}) {
    return Container(
      color: isSelected ? Colors.grey.shade200 : Colors.white,
      child: ListTile(
        onTap: () => Navigator.pushReplacementNamed(context, route),
        leading: Icon(
          icon,
          color: !isSelected ? Colors.grey.shade700 : Colors.green,
        ),
        title: Text(
          name,
          style: TextStyle(
              color: !isSelected ? Colors.grey.shade700 : Colors.green, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.05)),
      child: Drawer(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(top: 25),
          //color: Colors.grey,
          child: Column(
            children: [
              //Image.asset(''),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        addItem(
                            context: context,
                            name: 'Recents',
                            icon: Icons.recent_actors_outlined,
                            route: RecentScreen.routeName,
                            isSelected: whatIsSelected == 'recents'
                            ),
                        addItem(
                            context: context,
                            name: 'Calculator',
                            icon: Icons.calculate,
                            route: CalculatorScreen.routeName,
                            isSelected: whatIsSelected == 'cal'
                            ),
                        addItem(
                            context: context,
                            name: 'Converter',
                            icon: Icons.coronavirus_outlined,
                            route: UnitConverterScreen.routeName,
                            isSelected: whatIsSelected == 'uc'
                            ),
                        addItem(
                            context: context,
                            name: 'Geometry',
                            icon: Icons.circle,
                            route: GeometryScreen.routeName,
                            isSelected: whatIsSelected == 'geo'
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
