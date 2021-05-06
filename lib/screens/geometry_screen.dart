import 'package:flutter/material.dart';
import 'package:testss/widgets/drawer.dart';

class GeometryScreen extends StatelessWidget {
  static const routeName = '/geo';
  listItem(
      {@required BuildContext context,
      @required String name,
      @required IconData icon,
      @required String rountes}) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, rountes),
            child: Container(
              height: 50,
              child: Card(
          child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(icon),
              ),
              SizedBox(width: 10,),
              Text(name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.grey.shade700),)
          ],),
        ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry'),
      ),
      drawer: MyDrawer(whatIsSelected: 'geo'),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
              listItem(context: context, name: 'Square', icon: Icons.circle, rountes: ''),
            ],
          ),
        ),
      ),
    );
  }
}
