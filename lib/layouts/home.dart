import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data['worldTime']);

    //get the background image
    String bgImage = data['worldTime'].isDay ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['worldTime'].isDay ? Colors.blue : Colors.indigo;
    Color timeColor = data['worldTime'].isDay ? Colors.white70 : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['worldTime'].location,
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: timeColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  data['worldTime'].time,
                  style: TextStyle(
                    fontSize: 56.0,
                    color: timeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
