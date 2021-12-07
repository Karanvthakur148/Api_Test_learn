import 'package:flutter/material.dart';

import 'apicaling_two.dart';
import 'apiservice.dart';

class ApiPage extends StatefulWidget {
  const  ApiPage({Key? key}) : super(key: key);

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {

  final APICalling _apiCalling = APICalling();

   dynamic defaultData;

  void callDefault()async{
    var response = await _apiCalling.getCountries();

    setState(() {
      defaultData = response;
    });
  }

  @override
  void initState() {
    callDefault();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: defaultData != null? ListView.builder(itemCount: defaultData!.length,
        itemBuilder: (context, index) {
          return  Card(
            child: ListTile(
              leading: GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondApiPage(country: defaultData[index]["Country"],);
                },));
              },
                  child: Text('karan')),
              title: Text("Country - " + defaultData![index]["Country"]),
              subtitle: Text(defaultData![index]["Slug"]),
              trailing: Text(defaultData![index]["ISO2"]),
            ),
          );
        },):Center(child: const SizedBox(height: 50,width: 50,
        child: CircularProgressIndicator(),)),
    );

  }
}
