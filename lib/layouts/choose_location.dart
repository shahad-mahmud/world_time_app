import 'package:flutter/material.dart';
import 'package:worldtime/services/worldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flagUrl: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flagUrl: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flagUrl: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flagUrl: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flagUrl: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flagUrl: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flagUrl: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flagUrl: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {

    void updateTime(index) async{
      await locations[index].getTime();
      Navigator.pop(context, {
        'worldTime': locations[index]
      });
    }

    print('Build ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 4.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/${locations[index].flagUrl}'
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
