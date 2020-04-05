import 'package:coronavirusapp/screens/country_wise_corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:coronavirusapp/common_utils.dart';

class CoronaStats extends StatefulWidget {
  @override
  _CoronaStatsState createState() => _CoronaStatsState();
}

class _CoronaStatsState extends State<CoronaStats> {
  Widget Countrieslist() {
    return FutureBuilder<dynamic>(
      future: CountryCodesFetch().getCountryCodesFromUrl(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, i) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            CountryWiseCorona.routeArgs,
                            arguments: {
                              'Country': snapshot.data[i]['Country'],
                              'CountryCode': snapshot.data[i]['CountryCode'],
                              'TotalConfirmed': snapshot.data[i]['TotalConfirmed'],
                                'totalDeaths': snapshot.data[i]['TotalDeaths'],
                                'TotalRecovered': snapshot.data[i]['TotalRecovered'],
                            });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, left: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Flags.getMiniFlag(snapshot.data[i]['CountryCode'],
                                          40, 40) ==
                                      null
                                  ? Text('No logo Found')
                                  : Flags.getMiniFlag(
                                      snapshot.data[i]['CountryCode'], 40, 40),
                              Text(
                                snapshot.data[i]['Country'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget getData(String data, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          Spacer(),
          Text(
            data,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget globaldata() {
    return FutureBuilder<dynamic>(
      future: CountryCodesFetch().getAllGlobalInfo(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              getData(' ${snapshot.data[0]['total_cases']}', 'Total Cases'),
              getData(
                  ' ${snapshot.data[0]['total_recovered']}', 'Total Recovered'),
              getData('${snapshot.data[0]['total_unresolved']}',
                  'Total UnResolved'),
              getData('${snapshot.data[0]['total_deaths']}', 'Total Deaths'),
              getData('${snapshot.data[0]['total_new_cases_today']}',
                  'Total new cases:'),
              getData('${snapshot.data[0]['total_new_deaths_today']}',
                  'Total new deaths: '),
              getData('${snapshot.data[0]['total_active_cases']}',
                  'Total active cases '),
              getData('${snapshot.data[0]['total_serious_cases']}',
                  'Total serious cases '),
              getData('${snapshot.data[0]['total_affected_countries']}',
                  'Total affected countries '),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Corona Tracker',
        ),
        centerTitle: true,
        leading: Icon(Icons.clear_all),
        actions: <Widget>[
          Icon(
            Icons.more_vert,
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Countrieslist(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.65,
              child: globaldata(),
            ),
          ],
        ),
      ),
    );
  }
}
