import 'package:flutter/material.dart';
import 'package:newworkapi/apiservice.dart';

class ApiFourPage extends StatefulWidget {
  const ApiFourPage({Key? key}) : super(key: key);

  @override
  _ApiFourPageState createState() => _ApiFourPageState();
}

class _ApiFourPageState extends State<ApiFourPage> {

  final APICalling _apiCalling = APICalling();
  dynamic statsData;

  void callStats()async{
    var response = await _apiCalling.getStatsData();
    setState(() {
      statsData = response;
    });
  }

  @override
  void initState() {
    callStats();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: statsData != null ? ListView.builder(itemCount: 5,
        itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(statsData["Total"].toString()),
              Text(statsData["Countries"].toString()),
              Text(statsData["CountriesUpdated"].toString()),
              Text(statsData["ByCountry"].toString()),
              Text(statsData["PremiumTravelAdviceUpdated"].toString()),

            ],
          ),
        );
      },):Center(child: CircularProgressIndicator()),
    );
  }
}
