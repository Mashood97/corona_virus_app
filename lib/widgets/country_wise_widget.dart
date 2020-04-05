import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class CountryWiseWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  CountryWiseWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flags.getFullFlag(data['CountryCode'], 75, 75) == null
              ? Text('No logo Found')
              : Flags.getMiniFlag(data['CountryCode'], 75, 75),
          Text(
            data['Country'],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Total Confirmed'),
            subtitle: Text(data['TotalConfirmed'].toString()),
            trailing: Icon(
              Icons.confirmation_number,
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text('Total Deaths'),
            subtitle: Text(data['totalDeaths'].toString()),
            trailing: Text(
              'X',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: Text('Total Recovered'),
            subtitle: Text(data['TotalRecovered'].toString()),
            trailing: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
