import 'package:flutter/material.dart';
import 'package:newworkapi/apiservice.dart';

import 'apicalling_four.dart';

class ApiThreePage extends StatefulWidget {
  const ApiThreePage({Key? key}) : super(key: key);

  @override
  _ApiThreePageState createState() => _ApiThreePageState();
}

class _ApiThreePageState extends State<ApiThreePage> {

  final APICalling _apiCalling = APICalling();
  dynamic dayOneData;

  void callDayOne()async{
    var response = await _apiCalling.getOneDayData();
    setState(() {
      dayOneData = response;
    });
  }

  @override
  void initState() {
    callDayOne();    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: dayOneData !=null?ListView.builder(itemCount: dayOneData!.length,
        itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(dayOneData![index]["Country"]),
              Text(dayOneData![index]["CountryCode"]),
              Text(dayOneData![index]["Lat"]),
              Text(dayOneData![index]["Lon"]),
              Text(dayOneData![index]["Date"]),

            ],
          ),
        );
      },):Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ApiFourPage();
      },)) ;},),
    );
  }
}
